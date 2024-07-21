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
            product.expirationDate = null // Set expirationDate to null for no expiration
        } else if (!params.expirationDate) {
            product.expirationDate = null // Ensure expirationDate is null if not provided
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
}