package storeapp

import grails.gorm.transactions.Transactional


@Transactional
class MarketController {

    def view() {
        def marketProducts = MarketProduct.list()
        [marketProducts: marketProducts]
    }

    def index() {
        def warehouseProducts = WarehouseProduct.list()
        [warehouseProducts: warehouseProducts]
    }

    def addProduct(Long warehouseProductId) {
        def warehouseProduct = WarehouseProduct.get(warehouseProductId)
        if (!warehouseProduct) {
            flash.error = "Warehouse product not found."
            redirect(action: 'index')
            return
        }
        def marketProduct = new MarketProduct(
                product: warehouseProduct.product,
                quantity: warehouseProduct.quantity
        )
        if (marketProduct.validate()) {
            marketProduct.save(flush: true)
            warehouseProduct.quantity -= marketProduct.quantity
            warehouseProduct.save(flush: true)
            if (warehouseProduct.quantity <= 0) {
                warehouseProduct.delete(flush: true)
            }
            redirect(action: 'view')
        } else {
            render(view: 'index', model: [warehouseProducts: WarehouseProduct.list()])
        }
    }


    def removeProduct(Long marketProductId) {
        if (!marketProductId) {
            flash.error = "Invalid request: marketProductId is null."
            println "Invalid request: marketProductId is null."
            redirect(action: 'view')
            return
        }

        def marketProduct = MarketProduct.get(marketProductId)
        if (!marketProduct) {
            flash.error = "Market product not found."
            println "Market product not found for ID: $marketProductId"
            redirect(action: 'view')
            return
        }

        println "Removing market product: ${marketProduct.product.productName}, ID: ${marketProduct.id}"
        marketProduct.delete(flush: true)
        println "Market product successfully removed."
        flash.message = "Market product successfully removed."
        redirect(action: 'view')
    }


}