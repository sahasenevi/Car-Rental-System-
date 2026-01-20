<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - Rentora</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- FontAwesome CDN -->
  <script src="https://kit.fontawesome.com/48c2219736.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

  <!-- Header Section -->
  <header class="bg-white border-b shadow-sm">
    <div class="container mx-auto px-6 py-4 grid grid-cols-3 items-center">
      <!-- Left: Logo -->
      <div>
        <a href="HomePage.jsp" class="flex items-center text-gray-900 font-bold text-2xl transition duration-300 ease-in-out hover:text-blue-600 hover:scale-105">
          <img src="Logo.jpg" alt="Rentora Logo" class="h-10 w-auto mr-2 object-contain" />
          Rentora
        </a>
      </div>
      <!-- Center: Search Bar -->
      <div class="flex justify-center">
        <div class="relative w-full max-w-md">
          <input type="text" placeholder="Search cars..." class="w-full pl-4 pr-10 py-2 rounded-full bg-gray-100 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500" />
          <button class="absolute right-0 top-0 mt-2 mr-3 text-gray-600 hover:text-gray-800">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
      <!-- Right: Navigation -->
      <div class="flex justify-end items-center space-x-6">
        <a href="HomePage.jsp" class="text-gray-800 hover:text-blue-600 transition">Home</a>
		<a href="AllVehicles.jsp" class="text-gray-800 hover:text-blue-600 transition">Vehicles</a>
		<a href="aboutUs.jsp" class="text-gray-800 hover:text-blue-600 transition">About</a>
		<a href="contact.jsp" class="text-gray-800 hover:text-blue-600 transition">Contact</a>
		<a href="Login.jsp" class="text-gray-800 hover:text-blue-600 transition">
		  <i class="fas fa-user-circle fa-2x"></i>
		</a>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <main class="flex-grow">
    <!-- Hero Banner -->
    <section class="relative w-full h-[400px] bg-cover bg-center" style="background-image: url('images/about-banner.jpg');">
      <div class="absolute inset-0 bg-black opacity-50"></div>
      <div class="relative container mx-auto px-6 py-20 flex items-center justify-center">
        <div class="text-center">
          <h1 class="text-5xl font-bold text-white mb-4">About Rentora</h1>
          <p class="text-xl text-gray-200">Revolutionizing the way you rent cars online.</p>
        </div>
      </div>
    </section>

    <!-- Our Story Section -->
    <section class="container mx-auto px-6 py-12">
      <div class="max-w-3xl mx-auto">
        <h2 class="text-4xl font-bold text-center text-gray-800 mb-6">Our Story</h2>
        <p class="text-gray-700 leading-relaxed mb-4">
          At <span class="font-semibold">Rentora</span>, we are committed to providing a seamless, affordable, and trustworthy car rental experience. Our journey began with a vision to transform the traditional car rental process into a hassle-free, modern experience that caters to every traveler.
        </p>
        <p class="text-gray-700 leading-relaxed">
          With a wide selection of vehicles, competitive pricing, and 24/7 customer support, we empower you to hit the road with confidence and ease. Join us as we reimagine the future of car rentals.
        </p>
      </div>
    </section>

    <!-- Our Services Section with Smart Hover Functions -->
    <section class="bg-gray-50 py-12">
      <div class="container mx-auto px-6">
        <h2 class="text-4xl font-bold text-center text-gray-800 mb-8">Our Services</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
          <!-- Service Card 1 -->
          <div class="relative group bg-white rounded-lg shadow-lg overflow-hidden">
            <img src="images/services-vehicles.jpg" alt="Wide Range of Vehicles" class="w-full h-40 object-cover transition-transform duration-300 group-hover:scale-105">
            <div class="p-4">
              <h3 class="text-xl font-bold text-gray-800 mb-2">Wide Range of Vehicles</h3>
              <p class="text-gray-600">From luxury sedans to spacious SUVs, choose the perfect ride for your journey.</p>
            </div>
            <!-- Hover Overlay -->
            <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-60 transition duration-300 flex items-center justify-center opacity-0 group-hover:opacity-100">

            </div>
          </div>
          <!-- Service Card 2 -->
          <div class="relative group bg-white rounded-lg shadow-lg overflow-hidden">
            <img src="images/services-pricing.png" alt="Affordable Pricing" class="w-full h-40 object-cover transition-transform duration-300 group-hover:scale-105">
            <div class="p-4">
              <h3 class="text-xl font-bold text-gray-800 mb-2">Affordable Pricing</h3>
              <p class="text-gray-600">Competitive rates and special offers designed to suit every budget.</p>
            </div>
            <!-- Hover Overlay -->
            <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-60 transition duration-300 flex items-center justify-center opacity-0 group-hover:opacity-100">

            </div>
          </div>
          <!-- Service Card 3 -->
          <div class="relative group bg-white rounded-lg shadow-lg overflow-hidden">
            <img src="images/services-support.png" alt="24/7 Customer Support" class="w-full h-40 object-cover transition-transform duration-300 group-hover:scale-105">
            <div class="p-4">
              <h3 class="text-xl font-bold text-gray-800 mb-2">24/7 Customer Support</h3>
              <p class="text-gray-600">Our dedicated team is here to help you anytime, ensuring a smooth experience.</p>
            </div>
            <!-- Hover Overlay -->
            <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-60 transition duration-300 flex items-center justify-center opacity-0 group-hover:opacity-100">

            </div>
          </div>
          <!-- Service Card 4 -->
          <div class="relative group bg-white rounded-lg shadow-lg overflow-hidden">
            <img src="images/services-booking.jpeg" alt="Easy Booking Process" class="w-full h-40 object-cover transition-transform duration-300 group-hover:scale-105">
            <div class="p-4">
              <h3 class="text-xl font-bold text-gray-800 mb-2">Easy Booking Process</h3>
              <p class="text-gray-600">A streamlined and user-friendly booking system that gets you on the road fast.</p>
            </div>
            <!-- Hover Overlay -->
            <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-60 transition duration-300 flex items-center justify-center opacity-0 group-hover:opacity-100">
  
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <!-- Footer Section -->
  <footer class="bg-gray-900 text-gray-300">
    <div class="container mx-auto px-6 py-10">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8 items-start">
        <!-- About Rentora -->
        <div>
          <h3 class="text-2xl font-bold text-white">Rentora</h3>
          <p class="mt-4 text-gray-400">
            Rentora offers a seamless online car rental experience with a wide range of vehicles to suit every journey.
          </p>
          <div class="mt-4 flex space-x-4">
            <a href="#" class="text-gray-400 hover:text-white transition">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="text-gray-400 hover:text-white transition">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="#" class="text-gray-400 hover:text-white transition">
              <i class="fab fa-instagram"></i>
            </a>
            <a href="#" class="text-gray-400 hover:text-white transition">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div>
        </div>
        <!-- Quick Links -->
        <div>
          <h4 class="text-xl font-semibold text-white mb-4">Quick Links</h4>
          <ul>
				<li class="mb-2"><a href="HomePage.jsp" class="hover:text-white transition">Home</a></li>
				<li class="mb-2"><a href="AllVehicles.jsp" class="hover:text-white transition">Vehicles</a></li>
				<li class="mb-2"><a href="aboutUs.jsp" class="hover:text-white transition">About</a></li>
				<li class="mb-2"><a href="contact.jsp" class="hover:text-white transition">Contact</a></li>
          </ul>
        </div>
        <!-- Contact Info -->
        <div>
          <h4 class="text-xl font-semibold text-white mb-4">Contact Us</h4>
          <p class="mb-2">
            <i class="fas fa-map-marker-alt mr-2"></i>  
            1234 Street Name, City, Country
          </p>
          <p class="mb-2">
            <i class="fas fa-phone mr-2"></i>  
            +1 (234) 567-890
          </p>
          <p class="mb-2">
            <i class="fas fa-envelope mr-2"></i>  
            support@rentora.com
          </p>
        </div>
        <!-- Newsletter -->
        <div>
          <h4 class="text-xl font-semibold text-white mb-4">Newsletter</h4>
          <p class="text-gray-400 mb-4">Subscribe to get the latest updates and offers.</p>
          <form class="flex">
            <input type="email" placeholder="Enter your email" class="w-full px-3 py-2 rounded-l focus:outline-none">
            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 rounded-r transition">
              Subscribe
            </button>
          </form>
        </div>
      </div>
    </div>
    <div class="bg-gray-800 py-4">
      <div class="container mx-auto px-6 text-center">
        <p class="text-gray-500">&copy; 2025 Rentora. All rights reserved.</p>
      </div>
    </div>
  </footer>

</body>
</html>
