library(data.table)

sales = as.data.table(mtcars)[,.(
    retailer = carb,
    type = am,
    city = gear,
    sales = qsec,
    value = disp,
    promo = vs
)]

print(sales[, mean(promo*sales)])