task description: 

Implement a store application with the Grails framework
with the following parts
Product. should have a code, name, price, production date, expiration date. if the product does not have an expiration date, it should remain empty. it should be possible to create a product, edit it, remove it if it is not used anywhere.

Warehouse. which should have the following fields
code, name, list of products, where it will be possible to specify the quantity. it should be possible to add items, remove items and send them


Shop with the following fields.
code, name, address, list of products, where it will be possible to specify the quantity.
it should be possible to sell the product, return it to the warehouse, if the product has expired, it should be automatically returned to the warehouse from which it was shipped


---------------------------Solution--------------------------------
i've implemented this app via Grovy language, as a main framework i used grails, also used some springand java libraries.
for database i used H2, in memory database.
for view part i used GSP framework
For product,wareHouse nad marker db level we have associations.
application constructed from 3 main pages, product(where we create new product), wareHouse(where after creation we can save product), and market(from where we can sale product).


1) Product:
for product we have 3 properties primaryCode, productName, dateOfAppointment and expirationDate. There are checkBox if be select it expirationDate can be empty(for example shoes).
we can add new product, edit and remove it all functions implement and working as expected.
//////image should be here

2) WareHouse:
Here we can save product for moving to market, Database level i used asscations for accsesing product details.
if Product page is empty we should create latest one product, for that in this page we have a link via that link we can redirect to Product page and create product after that only we can save it into WareHouse.
And we have WareHouse List page, from where we can redirect to market page, and to productPage.

3) Market part
from this side we can sale added product, if this page is empty we should redirect to warehoise add product in market.
If expiration date is greater than this date we cant sale product, and move it to wareHouse
Below you can see phots and demo video

1) H2 db where we save product and because we don't mention expiration date it's empty
![2](https://github.com/user-attachments/assets/c5f0b978-e2a3-449f-aaee-b7f3189ec876)
