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
    retailer %in% c(1,3,4),
    promo := 0
    ][
        promo_sales := sales / promo
        ]

print(sales[, mean(promo_sales, na.rm = T)])