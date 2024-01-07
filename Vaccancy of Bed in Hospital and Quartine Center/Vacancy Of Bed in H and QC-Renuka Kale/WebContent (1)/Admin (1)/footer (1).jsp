<%-- 
    Document   : footer
    Created on : 27 Mar, 2021, 3:34:40 PM
    Author     : hp
--%>

        </div>
        <script type="text/javascript">
            var acpt = document.getElementById('acpt');
            var pend = document.getElementById('pend');
            var comp = document.getElementById('comp');
            var tabAcpt = document.getElementById('tabAcpt');
            var tabPend = document.getElementById('tabPend');
            var tabComp = document.getElementById('tabComp');
            function viewAcpt(){
                acpt.style.display = 'block';
                tabAcpt.className = 'nav-link active text-warning';
                pend.style.display = 'none';
                tabPend.className = 'nav-link';
                comp.style.display = 'none';
                tabComp.className = 'nav-link';
            }
            function viewPend(){
                pend.style.display = 'block';
                tabPend.className = 'nav-link active text-danger';
                acpt.style.display = 'none';
                tabAcpt.className = 'nav-link';
                comp.style.display = 'none';
                tabComp.className = 'nav-link';
            }
            function viewComp(){
                comp.style.display = 'block';
                tabComp.className = 'nav-link active text-success';
                acpt.style.display = 'none';
                tabAcpt.className = 'nav-link';
                pend.style.display = 'none';
                tabPend.className = 'nav-link';
            }
        </script>
    </body>
</html>