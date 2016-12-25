
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $databaseServer = "localhost";
    $databaseName = "restaurant";
    $databaseUser = "root";
    $databasePassword = "root";

    try {
        $dbConnection = new PDO("mysql:host=$databaseServer;dbname=$databaseName", $databaseUser, $databasePassword);
        // set the PDO error mode to exception
        $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // prepare sql and bind parameters

        $stmt1 = $dbConnection->prepare("INSERT INTO restaurant.restaurant_table (Name, Type_of_restaurant) VALUES (:restaurantName, :typeOfRestaurant)");
        $stmt1->bindParam(':restaurantName', $_POST['name']);
        $stmt1->bindParam(':typeOfRestaurant', $_POST['type']);

        // insert row in restaurant table
        $stmt1->execute();
        $restaurantId = $dbConnection->lastInsertId();

        $stmt2 = $dbConnection->prepare("INSERT INTO restaurant.restaurant_address ( Restaurant_id, Rest_Address, Longitude, Lattitude) VALUES (:restaurantId, :restaurantAddress, :longitude, :lattitude);");
        $stmt2->bindParam(':restaurantId', $restaurantId);
        $stmt2->bindParam(':restaurantAddress', $_POST['address']);
        $stmt2->bindParam(':longitude', $_POST['longitude']);
        $stmt2->bindParam(':lattitude', $_POST['lattitude']);

        // insert a row in restaurant address
        $stmt2->execute();

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    $conn = null;
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Restaurant</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container" role="main" style="background-color: rgba(204, 204, 204, 0.23);max-width: 750px !important;margin-top: 30px;padding-bottom: 30px;">
    <h1>Add Restaurant</h1>
    <br />
    <form class="col-md-6" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <?php if ($_SERVER["REQUEST_METHOD"] == "POST") { ?>
        <div class="alert alert-success alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">×</span></button>
            <strong>Success!</strong> Restaurant <a href="review.php?rest_id=<?php echo $restaurantId; ?>">"<?php echo $_POST['name'];?>"</a> has been successfully added.
        </div>
        <?php } ?>
        <div class="form-group">
            <label for="name">Restaurant Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Restaurant Name">
        </div>
        <div class="form-group">
            <label for="type">Restaurant Type</label>
            <select id="type" name="type" class="form-control">
                <option value="Ethnic">Ethnic</option>
                <option value="Fast_Food">Fast Food</option>
                <option value="Fast_Casual">Fast Casual</option>
                <option value="Casual_Dinning">Casual Dinning</option>
                <option value="Family_Style">Family Style</option>
                <option value="Fine_Dinning">Fine Dinning</option>
            </select>
        </div>
        <div class="form-group">
            <label for="address">Restaurant Address</label>
            <textarea id="address" name="address" class="form-control" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="longitude">Longitude</label>
            <input type="text" class="form-control" id="longitude" name="longitude" placeholder="Longitude">
        </div>
        <div class="form-group">
            <label for="latitude">Lattitude</label>
            <input type="text" class="form-control" id="lattitude" name="lattitude" placeholder="Lattitude">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>


</div> <!-- /container -->


</body>
</html>