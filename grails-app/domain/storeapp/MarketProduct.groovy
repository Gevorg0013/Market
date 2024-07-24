package storeapp

class MarketProduct {

    Product product
    int quantity

    static belongsTo = [product: Product]

    static constraints = {
        product nullable: false
        quantity min: 0
    }
}
