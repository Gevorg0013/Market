package storeapp

import java.time.LocalDate

class Product {
    String coverLetter
    String title
    BigDecimal price
    LocalDate dateOfAppointment
    LocalDate expirationDate // This can be null

    static constraints = {
        coverLetter blank: false, size: 1..500
        title blank: false, size: 1..255
        price nullable: false, min: 0.0
        dateOfAppointment nullable: false
        expirationDate nullable: true // Can be empty
    }
}