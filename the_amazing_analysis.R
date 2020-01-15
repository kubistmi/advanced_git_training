library(data.table)

sales = as.data.table(mtcars)[,.(
    retailer = carb,
    type = am,
    city = gear,
    sales = qsec,
    value = disp,
    promo = vs
)]

sales[
    promo_sales := sales / promo
    ][
        retailer %in% c(1,3,4),
        promo := 0
        ]

print(sales[, mean(promo_sales, na.rm = T)])