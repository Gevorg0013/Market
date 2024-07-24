// grails-app/controllers/storeapp/WarehouseController.groovy

package storeapp

import grails.gorm.transactions.Transactional
import java.time.LocalDate

import storeapp.Warehouse
import storeapp.Product
import storeapp.WarehouseProduct

//import org.springframework.transaction.annotation.Transactional

@Transactional
class WarehouseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def warehouses = Warehouse.list()
        def warehouse = warehouses.isEmpty() ? null : warehouses.first()
        def availableProducts = Product.list()
        [warehouse: warehouse, availableProducts: availableProducts]
    }

    @Transactional
    def addProduct() {
        try {
            if (!params.productId || !params.quantity.toInteger() || params.quantity.toInteger() <= 0) {
                log.error("Missing or invalid productId or quantity")
                render(view: "/warehouse/error")
                return
            }

            def product = Product.get(params.productId as Long)
            if (!product) {
                product = new Product(
                        coverLetter: params.coverLetter ?: '', // Default to empty string if not provided
                        productName: params.productName ?: '',
                        price: params.price ? params.price.toBigDecimal() : BigDecimal.ZERO, // Default to zero if not provided
                        dateOfAppointment: LocalDate.parse(params.dateOfAppointment),
                        expirationDate: params.expirationDate ? LocalDate.parse(params.expirationDate) : null
                )
            }

            product.save(flush: true)

            def warehouse = Warehouse.findByName('Main Warehouse') ?: new Warehouse(code: '1', name: 'Main Warehouse')
            warehouse.save(flush: true)

            def warehouseProduct = new WarehouseProduct(warehouse: warehouse, product: product)
            warehouseProduct.quantity += params.quantity.toInteger()
            def save = warehouseProduct.save(flush: true)
            println("save013: " + save);
            if (save) {
                println("WarehouseProduct saved successfully with ID: ${warehouseProduct.id}")
                redirect(action: 'showWarehouseProduct')
            } else {
                println("Failed to save WarehouseProduct. Errors: ${warehouseProduct.errors}")
            }
        } catch (Exception e) {
            log.error("Error adding product: ${e.message}", e)
            render(view: "/warehouse/error")
        }
    }

    def removeProductFromWarehouse(Long warehouseProductId) {
        def warehouseProduct = WarehouseProduct.get(warehouseProductId)
        if (!warehouseProduct) {
            flash.message = "Warehouse product not found."
        } else {
            warehouseProduct.delete()
            flash.message = "Product removed from warehouse."
        }
        redirect(action: 'showWarehouseProduct')
    }

    def create() {
        def products = Product.list()
        [products: products]
    }

    def showWarehouseProduct() {
        def warehouseProduct = WarehouseProduct.first()

        if (!warehouseProduct) {
            log.error("No warehouse products found")
            render(view: "/warehouse/emptyWarehouseError")
            return
        }
        def warehouseProducts = WarehouseProduct.findAllByWarehouse(warehouseProduct.warehouse)
        [warehouseProduct: warehouseProduct, warehouseProducts: warehouseProducts]
    }

}