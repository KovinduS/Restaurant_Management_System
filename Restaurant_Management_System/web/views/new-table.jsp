<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MaYa BaY - Add New Table</title>
 <style>
    /* ===== Base Styles ===== */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #e0f7fa;
        color: #003f5c;
        min-height: 100vh;
        position: relative;
    }
    
    /* ===== Container ===== */
    .container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0, 150, 136, 0.1);
        border: 1px solid #b2ebf2;
    }

    h1 {
        color: #006064;
        margin-bottom: 1.5rem;
        font-size: 2rem;
        border-bottom: 2px solid #4dd0e1;
        padding-bottom: 0.5rem;
    }
    
    /* ===== Form Elements ===== */
    .form-group {
        margin-bottom: 1.5rem;
    }

    label { 
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
        color: #00838f;
    }

    input[type="text"],
    input[type="number"],
    select,   
    textarea {
        width: 100%;
        padding: 0.8rem;
        border: 1px solid #b2ebf2;
        border-radius: 6px;
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
    
    /* ===== Buttons ===== */
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
    
   .btn-secondary { 
        background-color: #607d8b;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
   }
   
    .btn-secondary:hover {
        background-color: #455a64;
    }
    
    .action-buttons {
        margin-top: 2rem;
        display: flex;
        gap: 1rem;
    } 
    
    /* ===== Error Message ===== */
    .error {
        color: #d32f2f;
        margin-bottom: 1.5rem;
        padding: 1rem;
        background-color: rgba(211, 47, 47, 0.05);
        border-left: 4px solid #d32f2f;
        border-radius: 4px;
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
    
    /* ===== Status Options ===== */
    option[value="Available"] {
        background-color: rgba(76, 175, 80, 0.1);
    }
    
    option[value="Reserved"] {
        background-color: rgba(255, 152, 0, 0.1);
    }
    
    option[value="Occupied"] {
        background-color: rgba(244, 67, 54, 0.1);
    }
    
    option[value="Out of Service"] {
        background-color: rgba(96, 125, 139, 0.1);
    }
    
    /* ===== Responsive Design ===== */
    @media (max-width: 768px) {
        .container {
            margin: 1rem;
            padding: 1.5rem;
        }
        
        .action-buttons {
            flex-direction: column;
        }
        
        .btn {
            width: 100%;
            text-align: center;
        }
    }
</style>
</head>
<body>
    <div class="water-decoration" style="top:20%; left:10%;"></div>
    <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
    
    <jsp:include page="/views/header.jsp" />
    
    <div class="container">
        <h1>Add New Table</h1>
        
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
            
        <form action="${pageContext.request.contextPath}/tables/create" method="post">
            <div class="form-group">
                <label for="tableNumber">Table Number</label>
                <input type="number" id="tableNumber" name="tableNumber" required min="1" placeholder="Enter table number">
            </div> 
            
            <div class="form-group">
                <label for="capacity">Capacity</label>
                <input type="number" id="capacity" name="capacity" required min="1" max="20" placeholder="Number of seats">
            </div>
            
            <div class="form-group">
                <label for="location">Location</label>
                <select id="location" name="location" required>
                    <option value="">Select Location</option>
                    <option value="Coral Reef">Coral Reef</option>
                    <option value="Deep Blue">Deep Blue</option>
                    <option value="Pearl Cove">Pearl Cove</option>
                    <option value="Sun Deck">Sun Deck</option>
                    <option value="Lagoon View">Lagoon View</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="status">Status</label>
                <select id="status" name="status" required>
                    <option value="Available" selected>Available</option>
                    <option value="Reserved">Reserved</option>
                    <option value="Occupied">Occupied</option>
                    <option value="Out of Service">Out of Service</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="description">Description (Optional)</label>
                <textarea id="description" name="description" rows="3" placeholder="Any special features or notes"></textarea>
            </div>
            
            <div class="action-buttons">
                <button type="submit" class="btn">Save Table</button>
                <a href="${pageContext.request.contextPath}/tables" class="btn btn-secondary">Cancel</a>
            </div>new-table
        </form>    
    </div>
            
    <jsp:include page="/views/footer.jsp" />       
</body>
</html>