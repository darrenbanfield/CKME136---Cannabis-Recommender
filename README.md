# CKME136---Cannabis-Recommender
Recommender Project for School Project

looking to grab something like the following: (UCPC is the Primary Key code they are trying to establish as a standard)

    /strains/:ucpc
    get/strains/:ucpc/reviews
    get/strains/:ucpc/seedCompany
    get/strains/:ucpc/genetics
    get/strains/:ucpc/children
    get/strains/:ucpc/availability

Then I also need the THC and CBD content, which is under Products, but we need the UCPC first.

    THC mg
    CBD mg

    /products
    get/products/type/:productType
    get/products/:ucpc
    get/products/:ucpc/reviews
    get/products/:ucpc/producer
    get/products/:ucpc/strain
    get/products/:ucpc/avail

Review info for strain, producer, ratings and Product Names are what I will need in the end. Can be all in a single page or multple JSON pages...I'll figure out how to parse it later(next few weeks I hope)
