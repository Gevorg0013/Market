package storeapp

import grails.gorm.transactions.Transactional


@Transactional
class ProductController {

    def index() {
        def products = Product.list()

        render(view: "index", model: [products: products])
    }

    def create() {
        [product: new Product()]
    }

    def save() {
        def product = new Product(params)

        // Check if expiration date is empty or null
        if (params.noExpirationDate == 'true') {
            product.expirationDate = null
        } else if (!params.expirationDate) {
            product.expirationDate = null
        }

        if (product.save(flush: true)) {
            redirect action: "index"
        } else {
            render(view: "create", model: [product: product])
        }
    }

    def edit(Long id) {
        def product = Product.get(id)
        if (!product) {
            flash.message = "Product not found"
            redirect action: "index"
        } else {
            render(view: "edit", model: [product: product])
        }
    }

    def update(Long id) {
        def product = Product.get(id)
        if (!product) {
            flash.message = "Product not found"
            redirect action: "index"
        } else {
            product.properties = params
            if (product.save(flush: true)) {
                redirect action: "index"
            } else {
                render(view: "edit", model: [product: product])
            }
        }
    }

    def delete(Long id) {
        def product = Product.get(id)
        if (product) {
            product.delete(flush: true)
        }
        redirect action: "index"
    }

    def moveExpiredProductsToWarehouse() {
        try {
            def expiredProducts = MarketProduct.withCriteria {
                product {
                    lt('expirationDate', new Date())
                }
            }

            expiredProducts.each { marketProduct ->
                // Simulate moving the product to the warehouse
                def warehouseProduct = new WarehouseProduct(
                        productName: marketProduct.product.productName,
                        quantity: marketProduct.quantity,
                        expirationDate: marketProduct.product.expirationDate
                )

                if (warehouseProduct.save()) {
                    // Optionally delete the product from the market
                    marketProduct.delete(flush: true)
                    println("Moved expired product to warehouse: ${warehouseProduct.productName}")
                } else {
                    // Handle save failure if needed
                    println("Failed to move product to warehouse: ${marketProduct.product.productName}")
                    throw new RuntimeException("Failed to move product to warehouse.")
                }
            }

            // Respond with success message
            render(status: 200, text: "Expired products moved to warehouse successfully.")
        } catch (Exception e) {
            // Respond with error message
            render(status: 500, text: "Failed to move expired products to warehouse: ${e.message}")
        }
    }
}