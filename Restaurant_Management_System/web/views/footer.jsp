<footer>
    <style>
        /* Footer */
        footer {
            text-align: center;
            padding: 0.002rem;
            background-color: #006064;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
         /*   display: flex;   */
            flex-direction: column;
            align-items: center;
        }
        
        .footer-links {
         /*   display: flex;    */
            margin-bottom: 1rem;
        }
        
        .footer-links a {
            color: white;
            margin: 0 1rem;
            text-decoration: none;
        }
        
        .footer-links a:hover {
            text-decoration: underline;
        }
        
        .footer-text {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.7);
        }
</style>
   

        <div class="footer-content">
            <div class="footer-links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
             
            </div>
            <p class="footer-text"> &copy; <%= new java.util.Date().getYear() + 1900 %> Maya Bay Restaurant | <%= new java.util.Date() %></p>
        </div>

    </footer>