// OP1:
db.products.insertMany([
  {
    product_id: "P001",
    name: "Smartphone",
    category: "Electronics",
    price: 25000,
    specs: {
      brand: "Samsung",
      warranty: "1 year",
      battery: "5000mAh"
    }
  },
  {
    product_id: "P002",
    name: "T-Shirt",
    category: "Clothing",
    price: 799,
    details: {
      brand: "Nike",
      size: ["S", "M", "L"],
      material: "Cotton"
    }
  },
  {
    product_id: "P003",
    name: "Milk",
    category: "Groceries",
    price: 60,
    info: {
      brand: "Amul",
      expiry_date: "2026-04-01",
      nutrition: {
        calories: 150,
        fat: "8g"
      }
    }
  }
]);
// OP2:
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});
// OP3:
db.products.find({
  category: "Groceries",
  "info.expiry_date": { $lt: "2025-01-01" }
});
// OP4:
db.products.updateOne(
  { product_id: "P001" },
  { $set: { discount_percent: 10 } }
);
// OP5:
db.products.aggregate([
  {
    $group: {
      _id: "$category",
      total_value: { $sum: "$price" }
    }
  }
]);
