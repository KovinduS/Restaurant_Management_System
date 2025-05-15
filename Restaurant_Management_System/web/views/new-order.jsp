<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>MaYa BaY - New Order</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e0f7fa;
        color: #003f5c;
        margin: 0;
        padding: 0;
    }
    
    .form-container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0, 150, 136, 0.15);
        border: 1px solid #b2ebf2;
    }
    
    h1 {
        color: #006064;
        margin-bottom: 1.5rem;
        border-bottom: 2px solid #4dd0e1;
        padding-bottom: 0.5rem;
    }
    
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
        color: #00838f;
    }
    
    input, select, textarea {
        width: 100%;
        padding: 0.8rem;
        border: 1px solid #b2ebf2;
        border-radius: 6px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }
    
    input:focus, select:focus, textarea:focus {
        outline: none;
        border-color: #00acc1;
        box-shadow: 0 0 0 3px rgba(0, 172, 193, 0.2);
    }
    
    .order-item {
        display: flex;
        gap: 1rem;
        margin-bottom: 1rem;
        align-items: center;
        padding: 1rem;
        background-color: #f5fdff;
        border-radius: 8px;
        border-left: 4px solid #00acc1;
    }
    
    .order-item select {
        flex: 2;
    }
    
    .order-item input {
        flex: 1;
        max-width: 100px;
    }
    
    .btn {
        padding: 0.7rem 1.5rem;
        background-color: #00acc1;
        color: white;
        border: none;
        border-radius: 30px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 1rem;
    }
    
    .btn:hover {
        background-color: #00838f;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    
    .btn-remove {
        background-color: #f44336;
    }
    
    .btn-remove:hover {
        background-color: #d32f2f;
    }
    
    .btn-add {
        background-color: #4CAF50;
        margin-bottom: 1.5rem;
    }
    
    .btn-add:hover {
        background-color: #388e3c;
    }
    
    .actions {
        margin-top: 2rem;
        display: flex;
        gap: 1rem;
    }
    
    .btn-cancel {
        background-color: #607d8b;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }
    
    .btn-cancel:hover {
        background-color: #455a64;
    }
    
    .error {
        color: #d32f2f;
        margin-bottom: 1.5rem;
        padding: 1rem;
        background-color: rgba(211, 47, 47, 0.05);
        border-left: 4px solid #d32f2f;
        border-radius: 4px;
    }
    
    /* Water-themed decoration */
    .water-decoration {
        position: absolute;
        width: 100px;
        height: 100px;
        background: url('${pageContext.request.contextPath}/assets/images/water-drop.png') no-repeat;
        background-size: contain;
        opacity: 0.1;
        z-index: -1;
    }
    
    @media (max-width: 768px) {
        .form-container {
            margin: 1rem;
            padding: 1.5rem;
        }
        
        .order-item {
            flex-direction: column;
            align-items: stretch;
        }
        
        .order-item input {
            max-width: 100%;
        }
        
        .actions {
            flex-direction: column;
        }
    }
</style>
</head>
<body>
    <jsp:include page="/views/header.jsp" />
    
    <div class="water-decoration" style="top:20%; left:10%;"></div>
    <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
    
    <div class="form-container">
        <h1>Create New Order</h1>
        
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/orders/create" method="post">
            <div class="form-group">
                <label for="tableNumber">Table Number</label>
                <input type="number" id="tableNumber" name="tableNumber" required min="1" placeholder="Enter table number">
            </div>
            
            <div class="form-group">
                <label>Order Items</label>
                <div id="items-container">
                    <!-- Initial item row -->
                    <div class="order-item">
                        <select name="itemId" required>
                            <option value="">Select Menu Item</option>
                            <c:forEach items="${menu_items}" var="item">
                                <option value="${item.itemId}">${item.itemName} - $${item.price}</option>
                            </c:forEach>
                        </select>
                        <input type="number" name="quantity" min="1" value="1" required placeholder="Qty">
                        <button type="button" class="btn btn-remove" onclick="removeItem(this)">Remove</button>
                    </div>
                </div>
                <button type="button" class="btn btn-add" onclick="addItem()">+ Add Another Item</button>
            </div>
            
            <div class="form-group">
                <label for="specialInstructions">Special Instructions</label>
                <textarea id="specialInstructions" name="specialInstructions" rows="3" placeholder="Any special requests or dietary restrictions"></textarea>
            </div>
            
            <div class="actions">
                <button type="submit" class="btn">Submit Order</button>
                <a href="${pageContext.request.contextPath}/orders" class="btn btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
    
    <jsp:include page="/views/footer.jsp" />
    
    <script>
        function addItem() {
            const container = document.getElementById('items-container');
            const newItem = document.createElement('div');
            newItem.className = 'order-item';
            newItem.innerHTML = `
                <select name="itemId" required>
                    <option value="">Select Menu Item</option>
                    <c:forEach items="${menu_items}" var="item">
                        <option value="${item.itemId}">${item.itemName} - $${item.price}</option>
                    </c:forEach>
                </select>
                <input type="number" name="quantity" min="1" value="1" required placeholder="Qty">
                <button type="button" class="btn btn-remove" onclick="removeItem(this)">Remove</button>
            `;
            container.appendChild(newItem);
            
            // Scroll to the new item
            newItem.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }
        
        function removeItem(button) {
            const container = document.getElementById('items-container');
            if (container.children.length > 1) {
                button.parentNode.remove();
            } else {
                alert("At least one item is required");
            }
        }
    </script>
</body>
</html> 