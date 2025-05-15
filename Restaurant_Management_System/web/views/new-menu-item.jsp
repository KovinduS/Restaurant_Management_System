<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MaYa BaY - Add New Menu Item</title>
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
                max-width: 800px;
                margin: 2rem auto;
                padding: 0 2rem;
            }
            h1 {
                color: #006064;
                margin-bottom: 1.5rem;
                font-size: 2rem;
                border-bottom: 2px solid #4dd0e1;
                padding-bottom: 0.5rem;
            }
            /* ===== Form Container ===== */
            .form-container {
                background: white;
                padding: 2rem;
                border-radius: 12px;
                box-shadow: 0 5px 20px rgba(0, 150, 136, 0.1);
                border: 1px solid #b2ebf2;
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
            textarea,
            select,
            input[type="file"] {
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
            textarea:focus,
            select:focus {
                outline: none;
                border-color: #00acc1;
                box-shadow: 0 0 0 3px rgba(0, 172, 193, 0.2);
                background-color: white;
            }
            textarea {
                min-height: 100px;
                resize: vertical;
            }
            /* ===== Buttons ===== */
            .btn {
                display: inline-block;
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
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
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
            /* ===== Preview Section ===== */
            .image-preview {
                margin-top: 1rem;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .image-preview img {
                max-width: 200px;
                max-height: 200px;
                border-radius: 8px;
                border: 2px dashed #b2ebf2;
                margin-top: 0.5rem;
                display: none;
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
                     padding: 1.5rem;
                }
            }
            
        </style>
    </head>
    <body>
        <div class="water-decoration" style="top:20%; left:10%;"></div>
        <div class="water-decoration" style="bottom:15%; right:10%; transform:rotate(30deg);"></div>
        
        <jsp:include page="/views/header.jsp" />
        
        <main class="container">
            <h1>Add New Menu Item</h1>
            
            <div class="form-container">
                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>
            
                    <form action="${pageContext.request.contextPath}/menu/create" method="post" enctype="multipart/form-data">
                         <div class="form-group">
                             <label for="itemName">Item Name</label>
                             <input type="text" id="itemName" name="itemName" required placeholder="Enter item name">
                        </div>
                         
                         <div class="form-group">
                             <label for="categoryId">Category</label>
                             <select id="categoryId" name="categoryId" required>
                                 <option value="">-- Select a Category --</option>
                                 <c:forEach var="category" items="${categories}">
                                        <option value="${category.categoryId}">${category.categoryName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                         
                         <div class="form-group">
                            <label for="description">Description</label>
                            <textarea id="description" name="description" placeholder="Enter item description"></textarea>
                         </div>
                         
                         <div class="form-group">
                              <label for="ingredients">Ingredients</label>
                              <textarea id="ingredients" name="ingredients" placeholder="List ingredients separated by commas"></textarea>
                         </div>
                         
                         <div class="form-group">
                             <label for="price">Price ($)</label>
                             <input type="number" id="price" name="price" step="0.01" min="0" required placeholder="0.00">
                         </div>
                         
                         <div class="form-group">
                              <label for="image">Item Image</label>
                              <input type="file" id="image" name="image" accept="image/*" onchange="previewImage(this)">
                              <div class="image-preview">
                                 <img id="imagePreview" src="#" alt="Image Preview">
                              </div>
                         </div>
                         
                         <div class="form-group">
                              <label for="isAvailable">Availability</label>
                              <select id="isAvailable" name="isAvailable">
                                 <option value="true" selected>Available</option>
                                 <option value="false">Not Available</option>
                              </select>
                         </div>
                                                
                         <button type="submit" class="btn">Add Menu Item</button>
                    </form>
            </div>
            
        </main>
                         <jsp:include page="/views/footer.jsp" />
                         
        <script>
        function previewImage(input) {
            const preview = document.getElementById('imagePreview');
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.style.display = 'block';
                    preview.src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    
    </body>
</html>
