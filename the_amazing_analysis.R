library(data.table)

sales = as.data.table(mtcars)[,.(
    retailer = carb,
    type = am,
    city = gear,
    sales = qsec,
    value = disp,
    promo = vs
)]

sales[retailer == 1,
      promo := 0
      ]

print(sales[, mean(promo*sales)])