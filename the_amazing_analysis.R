library(data.table)

sales = as.data.table(mtcars)[,.(
    retailer = carb,
    type = am,
    city = gear,
    sales = qsec,
    value = disp,
    promo = vs
)]

print(
    sales[,
          retailer %in% c(1,3,4),
          promo := 0
          ][
              promo_sales := sales / promo
              ][,
                mean(promo_sales, na.rm = T)
                ]
)