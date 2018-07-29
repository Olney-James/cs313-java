<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Number Submission</title>
    </head>
    <body>
        <h1>Number Submission</h1>
        <form action="ComputeSum" method="GET">
              First Number: <input type="text" name="first" /><br />
              Second Number: <input type="text" name="second" /><br /> 
              <input type="submit" value="Compute Sum" />
       </form>
    </body>
</html>
