<%--
  Created by IntelliJ IDEA.
  User: thien
  Date: 9/25/2022
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

<script>
    var footer = document.getElementById("fter");
    if (footer.offsetTop < window.innerHeight - footer.offsetHeight + 20) {
        footer.style.marginTop = 20 + window.innerHeight - footer.offsetHeight - footer.offsetTop + "px";
    }
</script>