<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title><?php echo $head_title; ?></title>
</head>

<body>
  <header>
  </header>

  <?php echo $content; ?>

  <footer>
  </footer>

  <!-- jQuery -->
  <script src="//code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script>
  var VIEW_SETTINGS = <?php echo json_encode($this->config->item('VIEW_SETTINGS'));?>;
</script>
<!-- script -->
<?php if (isset($script)) { echo $script; } ?>

</body>
</html>
