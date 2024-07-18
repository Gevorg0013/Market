// grails-app/conf/UrlMappings.groovy

class UrlMappings {

    static mappings = {
        "/warehouse"(controller: "warehouse") {
            action = [GET: "index", POST: "save"] // Adjust according to your needs
        }

        "/warehouse/create"(controller: "warehouse", action: "create")
        "/warehouse/edit/$id?"(controller: "warehouse", action: "edit")
        "/warehouse/delete/$id?"(controller: "warehouse", action: "delete")
        "/warehouse/addToWarehouse/$id?"(controller: "warehouse", action: "addToWarehouse")
        "/warehouse/removeFromWarehouse/$id?"(controller: "warehouse", action: "removeFromWarehouse")
        "/warehouse/sendToOtherWarehouse/$id?"(controller: "warehouse", action: "sendToOtherWarehouse")

        "/"(view: "/index")
        "500"(view: '/error')
    }
}
