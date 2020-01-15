library(data.table)

sales = as.data.table(mtcars)[,.(
    retailer = carb,
    type = am,
    city = gear,
    sales = qsec,
    value = disp,
    promo = vs
)]

sales[retailer %in% c(1,3,4,5),
      promo := 0
      ]

print(sales[, mean(promo*sales)])