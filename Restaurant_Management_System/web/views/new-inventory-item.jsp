<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MaYa BaY - Add Inventory Item</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* ===== Base Styles ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa;
            color: #003f5c;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* ===== Form Container ===== */
        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 150, 136, 0.1);
            border: 1px solid #b2ebf2;
        }

        .container h1 {
            color: #006064;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            border-bottom: 2px solid #4dd0e1;
            padding-bottom: 0.5rem;
        }

        /* ===== Form Elements ===== */
        .form-group {
            margin-bottom: 1.8rem;
        }

        label {
            display: block;
            margin-bottom: 0.6rem;
            font-weight: 600;
            color: #00838f;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 0.9rem;
            border: 1px solid #b2ebf2;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f5fdff;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #00acc1;
            box-shadow: 0 0 0 3px rgba(0, 172, 193, 0.2);
            background-color: white;
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        /* ===== Form Layout ===== */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        /* ===== Buttons ===== */
        .form-actions {
            margin-top: 2.5rem;
            display: flex;
            gap: 1.5rem;
        }

        .btn {
            display: inline-block;
            padding: 0.9rem 1.8rem;
            border-radius: 30px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
        }

        .btn-primary {
            background-color: #00acc1;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #00838f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .btn-secondary {
            background-color: #607d8b;
            color: white;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #455a64;
            transform: translateY(-2px);
        }

        /* ===== Error Message ===== */
        .error {
            color: #d32f2f;
            margin-bottom: 1.8rem;
            padding: 1.2rem;
            background-color: rgba(211, 47, 47, 0.08);
            border-left: 4px solid #d32f2f;
            border-radius: 6px;
        }

        /* ===== Water Bubble Decorations ===== */
        .water-decoration {
            position: absolute;
            width: 100px;
            height: 100px;
            background: url('${pageContext.request.contextPath}/assets/images/water-drop.png') no-repeat;
            background-size: contain;
            opacity: 0.1;
            z-index: -1;
        }

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .form-container {
                padding: 1.8rem;
            }
            
            .form-row {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="water-decoration" style="top:20%; left:10%;"></div>
    <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
    
    <jsp:include page="/views/header.jsp" />
    
    <main class="container">
        <div class="form-container">
            <h1>Add New Inventory Item</h1>
            
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            
            <form action="${pageContext.request.contextPath}/inventory/create" method="POST">
                <div class="form-group">
                    <label for="itemName">Item Name</label>
                    <input type="text" id="itemName" name="itemName" required placeholder="Enter item name">
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select id="category" name="category" required>
                            <option value="">Select Category</option>
                            <option value="Seafood">Seafood</option>
                            <option value="Vegetables">Vegetables</option>
                            <option value="Fruits">Fruits</option>
                            <option value="Dairy">Dairy</option>
                            <option value="Meat">Meat</option>
                            <option value="Dry Goods">Dry Goods</option>
                            <option value="Beverages">Beverages</option>
                            <option value="Spices">Spices</option>
                            <option value="Cleaning Supplies">Cleaning Supplies</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="unit">Unit</label>
                        <select id="unit" name="unit" required>
                            <option value="">Select Unit</option>
                            <option value="kg">Kilogram (kg)</option>
                            <option value="g">Gram (g)</option>
                            <option value="L">Liter (L)</option>
                            <option value="ml">Milliliter (ml)</option>
                            <option value="pcs">Pieces (pcs)</option>
                            <option value="box">Box</option>
                            <option value="bottle">Bottle</option>
                            <option value="pack">Pack</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="quantity">Initial Quantity</label>
                        <input type="number" id="quantity" name="quantity" step="0.01" min="0" required placeholder="0.00">
                    </div>
                    
                    <div class="form-group">
                        <label for="reorderLevel">Reorder Level</label>
                        <input type="number" id="reorderLevel" name="reorderLevel" step="0.01" min="0" required placeholder="Minimum stock level">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="supplier">Supplier</label>
                        <input type="text" id="supplier" name="supplier" placeholder="Supplier name">
                    </div>
                    
                    <div class="form-group">
                        <label for="location">Storage Location</label>
                        <input type="text" id="location" name="location" placeholder="Where to store this item">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="notes">Notes</label>
                    <textarea id="notes" name="notes" placeholder="Any special instructions or details"></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Save Inventory Item</button>
                    <a href="${pageContext.request.contextPath}/inventory" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </main>
    
    <jsp:include page="/views/footer.jsp" />
</body>
</html>