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

    def warehouseService

    def index() {
        def warehouses = Warehouse.list()
        def warehouse = warehouses.isEmpty() ? null : warehouses.first()
        def availableProducts = Product.list()
        [warehouse: warehouse, availableProducts: availableProducts]
    }



    @Transactional
    def addProduct() {
        try {
            // Validate required parameters
            if (!params.productId || !params.quantity.toInteger() || params.quantity.toInteger() <= 0) {
                log.error("Missing or invalid productId or quantity")
                render(view: "/warehouse/error") // Handle error appropriately
                return
            }

            // Retrieve product from params or create a new one
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

            // Save product
            product.save(flush: true)

            // Create and save warehouse (if needed)
            def warehouse = Warehouse.findByName('Main Warehouse') ?: new Warehouse(code: '1',name: 'Main Warehouse')
            warehouse.save(flush: true)

            // Create and save warehouse product
            def warehouseProduct = new WarehouseProduct(warehouse: warehouse, product: product)
            def save = warehouseProduct.save(flush: true)
            println("save013: " + save);
            if (save) {
                println("WarehouseProduct saved successfully with ID: ${warehouseProduct.id}")
                redirect(action: 'showWarehouseProduct', params: [warehouseProductId: warehouseProduct.id])
            } else {
                println("Failed to save WarehouseProduct. Errors: ${warehouseProduct.errors}")
            }
        } catch (Exception e) {
            log.error("Error adding product: ${e.message}", e)
            render(view: "/warehouse/error")
            // Optionally re-throw or handle the exception as needed
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
        redirect(action: 'index')
    }

    def create() {
        def products = Product.list()
        [products: products]
    }

    def save(Warehouse warehouse, Long[] productIds, Integer[] quantities) {
        // Implementation for creating new warehouses if needed
    }

    def edit(Long id) {
        // Implementation for editing warehouses if needed
    }

    def update(Long id) {
        // Implementation for updating warehouses if needed
    }

    def delete(Long id) {
        // Implementation for deleting warehouses if needed
    }

    def showWarehouseProduct(Long warehouseProductId) {
        def warehouseProduct = WarehouseProduct.get(warehouseProductId)
        if (!warehouseProduct) {
            log.error("WarehouseProduct not found for ID: $warehouseProductId")
            render(view: "/warehouse/error")
            return
        }

        // Pass all products in the warehouse to the view
        def warehouseProducts = WarehouseProduct.findAllByWarehouse(warehouseProduct.warehouse)

        [warehouseProduct: warehouseProduct, warehouseProducts: warehouseProducts]
    }
}