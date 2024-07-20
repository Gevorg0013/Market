package storeapp

class Warehouse {
    String code
    String name

    static hasMany = [products: WarehouseProduct]

    static constraints = {
        code unique: true
        name nullable: false
    }
}
