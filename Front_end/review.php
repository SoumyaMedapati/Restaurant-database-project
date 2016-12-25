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
        $stmt1 = $dbConnection->prepare("INSERT INTO restaurant.user (Email_id, Name) VALUES (:email, :name)");
        $stmt1->bindParam(':email', $_POST['email']);
        $stmt1->bindParam(':name', $_POST['name']);

        // insert row in users table; registers user
        $stmt1->execute();
        $restaurantId = $dbConnection->lastInsertId();

        $stmt2 = $dbConnection->prepare("INSERT INTO restaurant.review (em_id, Rest_id, price, Service, Food_quality, Ambience, Overall_experience, Coment) VALUES (:email, :restaurantId, :price, :service, :foodQuality, :ambience, :overallExperience, :coment);");
        $stmt2->bindParam(':email', $_POST['email']);
        $stmt2->bindParam(':restaurantId', $_POST['restaurantId']);
        $stmt2->bindParam(':price', $_POST['price']);
        $stmt2->bindParam(':service', $_POST['service']);
        $stmt2->bindParam(':foodQuality', $_POST['foodQuality']);
        $stmt2->bindParam(':ambience', $_POST['ambience']);
        $stmt2->bindParam(':overallExperience', $_POST['overallExperience']);
        $stmt2->bindParam(':coment', $_POST['coment']);

        // insert a row in reviews table
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
    <title>Rate our services!</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container" role="main" style="background-color: rgba(204, 204, 204, 0.23);max-width: 750px !important;">
    <h1>Rate our services!</h1>
    <br />
    <form class="col-md-6" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <?php if ($_SERVER["REQUEST_METHOD"] == "POST") { ?>
            <div class="alert alert-success alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <strong>Thank you!</strong> for submitting your review.
            </div>
        <?php } ?>
        <div class="form-group">
            <input type="hidden" id="restaurantId" name="restaurantId" value="<?php echo isset($_GET['rest_id']) ? $_GET['rest_id'] : 1; ?>">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Name">
            </div>
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email">
            </div>
            <div class="form-group">
                <label for="name">Price:</label>

                <div class="row">
                    <div class="col-md-6">
                        <input type="range" name="price" id="price" value="0" min="0" max="5"
                               oninput="priceLabel.value = price.value">
                    </div>
                    <div class="col-md-6">
                        <output name="priceLabel" id="priceLabel" style="padding: 0; margin-top: -5px;">0</output>
                    </div>
                </div>
            </div>
            <div class="form-group">

                <label for="name">Service:</label>

                <div class="row">
                    <div class="col-md-6">
                        <input type="range" name="service" id="service" value="0" min="0" max="5"
                               oninput="serviceLabel.value = service.value">
                    </div>
                    <div class="col-md-6">
                        <output name="serviceLabel" id="serviceLabel" style="padding: 0">0</output>
                    </div>
                </div>
            </div>
            <div class="form-group">

                <label for="name">Food Quality:</label>

                <div class="row">
                    <div class="col-md-6">
                        <input type="range" name="foodQuality" id="foodQuality" value="0" min="0" max="5"
                               oninput="foodQualityLabel.value = foodQuality.value">
                    </div>
                    <div class="col-md-6">
                        <output name="foodQualityLabel" id="foodQualityLabel" style="padding: 0">0</output>
                    </div>
                </div>
            </div>

            <div class="form-group">

                <label for="name">Ambience:</label>

                <div class="row">
                    <div class="col-md-6">
                        <input type="range" name="ambience" id="ambience" value="0" min="0" max="5"
                               oninput="ambienceLabel.value = ambience.value">
                    </div>
                    <div class="col-md-6">
                        <output name="ambienceLabel" id="ambienceLabel" style="padding: 0">0</output>
                    </div>
                </div>
            </div>


            <div class="form-group">

                <label for="name">Overall Experience:</label>

                <div class="row">
                    <div class="col-md-6">
                        <input type="range" name="overallExperience" id="overallExperience" value="0" min="0" max="5"
                               oninput="overallExperienceLabel.value = overallExperience.value">
                    </div>
                    <div class="col-md-6">
                        <output name="overallExperienceLabel" id="overallExperienceLabel" style="padding: 0">0</output>
                    </div>
                </div>
            </div>

            <div class="form-group">

                <label for="name">Comment:</label>

                <textarea id="coment" name="coment" class="form-control" rows="3"></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
        <br /><br />
    </form>


</div> <!-- /container -->


</body>
</html>