// grails-app/controllers/storeapp/WarehouseController.groovy

package storeapp

import org.springframework.transaction.annotation.Transactional

@Transactional(readOnly = true)
class WarehouseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def warehouseService

    def index() {
        def warehouses = Warehouse.list()
        [warehouses: warehouses]
    }

    def create() {
        [warehouse: new Warehouse()]
    }

    @Transactional
    def save(Warehouse warehouse) {
        if (warehouse.save()) {
            redirect(action: "index")
        } else {
            render(view: "create", model: [warehouse: warehouse])
        }
    }

    def edit(Long id) {
        def warehouse = Warehouse.get(id)
        if (!warehouse) {
            flash.message = "Warehouse not found"
            redirect(action: "index")
        } else {
            render(view: "edit", model: [warehouse: warehouse])
        }
    }

    @Transactional
    def update(Long id) {
        def warehouse = Warehouse.get(id)
        if (!warehouse) {
            flash.message = "Warehouse not found"
            redirect(action: "index")
        } else {
            warehouse.properties = params
            if (warehouse.save()) {
                redirect(action: "index")
            } else {
                render(view: "edit", model: [warehouse: warehouse])
            }
        }
    }

    @Transactional
    def delete(Long id) {
        def warehouse = Warehouse.get(id)
        if (warehouse) {
            warehouse.delete()
            flash.message = "Warehouse deleted"
        } else {
            flash.message = "Warehouse not found"
        }
        redirect(action: "index")
    }

    @Transactional
    def addToWarehouse(Long id) {
        def warehouse = Warehouse.get(id)
        def productId = params['productId'] as Long
        def product = Product.get(productId)
        def quantity = params['quantity'] as Integer

        try {
            warehouseService.addToWarehouse(warehouse, product, quantity)
            flash.message = "${quantity} ${product.name} added to ${warehouse.name}"
        } catch (Exception e) {
            flash.message = e.message
        }
        redirect(action: "edit", id: id)
    }

    @Transactional
    def removeFromWarehouse(Long id) {
        def warehouse = Warehouse.get(id)
        def productId = params['productId'] as Long
        def product = Product.get(productId)
        def quantity = params['quantity'] as Integer

        try {
            warehouseService.removeFromWarehouse(warehouse, product, quantity)
            flash.message = "${quantity} ${product.name} removed from ${warehouse.name}"
        } catch (Exception e) {
            flash.message = e.message
        }
        redirect(action: "edit", id: id)
    }

    @Transactional
    def sendToOtherWarehouse(Long id) {
        def warehouse = Warehouse.get(id)
        def productId = params['productId'] as Long
        def product = Product.get(productId)
        def quantity = params['quantity'] as Integer
        def toWarehouseId = params['toWarehouseId'] as Long
        def toWarehouse = Warehouse.get(toWarehouseId)

        try {
            warehouseService.sendToOtherWarehouse(warehouse, toWarehouse, product, quantity)
            flash.message = "${quantity} ${product.name} sent from ${warehouse.name} to ${toWarehouse.name}"
        } catch (Exception e) {
            flash.message = e.message
        }
        redirect(action: "edit", id: id)
    }
}
