// grails-app/controllers/storeapp/WarehouseController.groovy

package storeapp

import storeapp.Warehouse
import storeapp.Product
import storeapp.WarehouseProduct
import org.springframework.transaction.annotation.Transactional

@Transactional
class WarehouseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def warehouseService

    def index() {
        // Retrieve all warehouses
        def warehouses = Warehouse.list()

        // Check if there are any warehouses available
        def warehouse = warehouses.isEmpty() ? null : warehouses.first()

        // Fetch available products for adding to warehouse
        def availableProducts = Product.list()

        // Prepare model for rendering
        [warehouse: warehouse, availableProducts: availableProducts]
    }


    @Transactional
    def addProduct() {
        // Validate required parameters
        if (!params.productId || !params.quantity) {
            log.error("Missing productId or quantity")
            render(view: "error") // Render an error view or handle appropriately
            return
        }

        // Retrieve product from params
        def product = Product.get(params.productId as Long)

        // Validate product existence
        if (!product) {
            log.error("Product with id ${params.productId} not found")
            render(view: "error") // Render an error view or handle appropriately
            return
        }

        // Retrieve list of warehouses
        def warehouses = Warehouse.list()

        // Check if warehouses list is empty
        def warehouse = warehouses.isEmpty() ? createDefaultWarehouse() : warehouses.first()

        // Ensure both warehouse and product are saved
        if (isTransient(warehouse)) {
            warehouse.save(flush: true)
        }
        if (isTransient(product)) {
            product.save(flush: true)
        }

        // Now that both warehouse and product are saved, create or update the warehouse product entry
        def warehouseProduct = WarehouseProduct.findByWarehouseAndProduct(warehouse, product)
        if (!warehouseProduct) {
            warehouseProduct = new WarehouseProduct(warehouse: warehouse, product: product, quantity: params.quantity.toInteger())
        } else {
            warehouseProduct.quantity += params.quantity.toInteger()
        }

        warehouseProduct.save(flush: true)

        // Redirect back to the index page or handle success as needed
        redirect(action: "index")
    }

    def isTransient(entity) {
        // Check if the entity is transient (not saved to the database)
        entity.id == null
    }

    def createDefaultWarehouse() {
        // Create a new warehouse if none exist
        Warehouse warehouse = new Warehouse(name: "Default Warehouse")
        warehouse.save(flush: true)

        log.info("Created a new warehouse: ${warehouse.name}")
        return warehouse
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
}