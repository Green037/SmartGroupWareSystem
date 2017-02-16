<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="keywords" content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates,
								  Android Compatible web template, Smartphone Compatible web template,
								  free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
	
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="resources/css/font-awesome.css" rel="stylesheet"/>
	<link href="resource//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400" rel="stylesheet" type="text/css"/>
	<link href="resources/css/barChart.css" rel="stylesheet" type="text/css"/>
	<link href="resources/css/fabochart.css" rel="stylesheet"type="text/css"/>
	<link rel="stylesheet" href="resources/css/icon-font.min.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/vroom.css">
	
	<script src="resources/js/jquery-1.10.2.min.js"></script>
	<script src="resources/js/amcharts.js"></script>
	<script src="resources/js/serial.js"></script>
	<script src="resources/js/light.js"></script>
	<script src="resources/js/radar.js"></script>
	<script src="resources/js/css3clock.js"></script>
	<script src="resources/js/skycons.js"></script>
	<script src="resources/js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="resources/js/vroom.js"></script>
	<script type="text/javascript" src="resources/js/TweenLite.min.js"></script>
	<script type="text/javascript" src="resources/js/CSSPlugin.min.js"></script>
	<script src="resources/js/jquery.nicescroll.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="page-container">
		<!--/content-inner-->
		<div class="left-content">
			<div class="inner-content">
				<!-- header-starts -->
				<div class="header-section">
					<div class="clearfix"></div>
				</div>
				<!-- //header-ends -->
				<div class="outter-wp">
					<!--custom-widgets-->
					<div class="custom-widgets">
						<div class="row-one">
							<div class="col-md-3 widget">
								<div class="stats-left ">
									<h5>Today</h5>
									<h4>Users</h4>
								</div>
								<div class="stats-right">
									<label>90</label>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="col-md-3 widget states-mdl">
								<div class="stats-left">
									<h5>Today</h5>
									<h4>Visitors</h4>
								</div>
								<div class="stats-right">
									<label> 85</label>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="col-md-3 widget states-thrd">
								<div class="stats-left">
									<h5>Today</h5>
									<h4>Tasks</h4>
								</div>
								<div class="stats-right">
									<label>51</label>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="col-md-3 widget states-last">
								<div class="stats-left">
									<h5>Today</h5>
									<h4>Alerts</h4>
								</div>
								<div class="stats-right">
									<label>30</label>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<!--//custom-widgets-->

					<!--/float-charts-->
					<div class="area">

						<div class="clearfix"></div>
					</div>
					<!--//weather-charts-->
					<div class="graph-visualization">
						<div class="col-md-6 map-1">
							<h3 class="sub-tittle">Weather</h3>
							<div class="weather">
								<div class="weather-top">
									<div class="weather-top-left">
										<div class="degree">
											<figure class="icons">
												<canvas id="partly-cloudy-day" width="64" height="64">
																				</canvas>
											</figure>
											<span>37°</span>
											<div class="clearfix"></div>
										</div>
										<script>
											var icons = new Skycons({
												"color" : "#002561"
											}), list = [ "clear-night",
													"partly-cloudy-day",
													"partly-cloudy-night",
													"cloudy", "rain", "sleet",
													"snow", "wind", "fog" ], i;

											for (i = list.length; i--;)
												icons.set(list[i], list[i]);

											icons.play();
										</script>
										<p>
											FRIDAY <label>13</label> <sup>th</sup> AUG
										</p>
									</div>
									<div class="weather-top-right">
										<p>
											<i class="fa fa-map-marker"></i>Location
										</p>
										<label>Lorem ipsum</label>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="weather-bottom">
									<div class="weather-bottom1">
										<div class="weather-head">
											<h4>Cloudy</h4>
											<figure class="icons">
												<canvas id="cloudy" width="40" height="40"></canvas>
											</figure>
											<script>
												var icons = new Skycons({
													"color" : "#00C6D7"
												}), list = [ "clear-night",
														"cloudy",
														"partly-cloudy-night",
														"cloudy", "rain",
														"sleet", "snow",
														"wind", "fog" ], i;

												for (i = list.length; i--;)
													icons.set(list[i], list[i]);

												icons.play();
											</script>
											<h6>20°</h6>
											<div class="bottom-head">
												<p>Monday</p>
											</div>
										</div>
									</div>
									<div class="weather-bottom1 ">
										<div class="weather-head">
											<h4>Sunny</h4>
											<figure class="icons">
												<canvas id="clear-day" width="40" height="40">
																</canvas>

											</figure>
											<script>
												var icons = new Skycons({
													"color" : "#00C6D7"
												}), list = [ "clear-night",
														"clear-day",
														"partly-cloudy-night",
														"cloudy", "rain",
														"sleet", "snow",
														"wind", "fog" ], i;

												for (i = list.length; i--;)
													icons.set(list[i], list[i]);

												icons.play();
											</script>
											<h6>37°</h6>
											<div class="bottom-head">
												<p>Tuesday</p>
											</div>
										</div>
									</div>
									<div class="weather-bottom1">
										<div class="weather-head">
											<h4>Rainy</h4>
											<figure class="icons">
												<canvas id="sleet" width="40" height="40">
																	</canvas>
											</figure>
											<script>
												var icons = new Skycons({
													"color" : "#00C6D7"
												}), list = [ "clear-night",
														"clear-day",
														"partly-cloudy-night",
														"cloudy", "rain",
														"sleet", "snow",
														"wind", "fog" ], i;

												for (i = list.length; i--;)
													icons.set(list[i], list[i]);

												icons.play();
											</script>

											<h6>7°</h6>
											<div class="bottom-head">
												<p>Wednesday</p>
											</div>
										</div>
									</div>
									<div class="weather-bottom1 ">
										<div class="weather-head">
											<h4>Snowy</h4>
											<figure class="icons">
												<canvas id="snow" width="40" height="40">
																	</canvas>
											</figure>
											<script>
												var icons = new Skycons({
													"color" : "#00C6D7"
												}), list = [ "clear-night",
														"clear-day",
														"partly-cloudy-night",
														"cloudy", "rain",
														"sleet", "snow",
														"wind", "fog" ], i;

												for (i = list.length; i--;)
													icons.set(list[i], list[i]);

												icons.play();
											</script>
											<h6>-10°</h6>
											<div class="bottom-head">
												<p>Thursday</p>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>

							</div>

						</div>
						<div class="col-md-6 map-2">
							<div class="profile-nav alt">
								<section class="panel">
									<div class="user-heading alt clock-row terques-bg">
										<h3 class="sub-tittle clock">Easy Clock</h3>
									</div>
									<ul id="clock">
										<li id="sec"></li>
										<li id="hour"></li>
										<li id="min"></li>
									</ul>

									<ul class="clock-category">
										<li><a href="#" class="active"> <img
												src="resources/images/time.png" alt=""> <span>Clock</span>
										</a></li>
										<li><a href="#"> <img
												src="resources/images/alarm.png" alt=""> <span>Alarm</span>
										</a></li>
										<li><a href="#"> <img
												src="resources/images/watch.png" alt=""> <span>Stop
													watch</span>
										</a></li>
										<li><a href="#"> <img
												src="resources/images/timer.png" alt=""> <span>Timer</span>
										</a></li>
									</ul>
								</section>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>