<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us - Rentora</title>
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
          <img src="Logo.jpg" alt="Rentora Logo" class="h-10 w-auto mr-2 object-contain">
          Rentora
        </a>
      </div>
      <!-- Center: Search Bar -->
      <div class="flex justify-center">
        <div class="relative w-full max-w-md">
          <input type="text" placeholder="Search cars..." class="w-full pl-4 pr-10 py-2 rounded-full bg-gray-100 text-gray-800 focus:outline-none focus:ring-2 focus:ring-blue-500">
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

  <!-- Main Content: Contact Us Form & Info -->
  <main class="container mx-auto px-6 py-8 flex-grow">
    <h1 class="text-4xl font-bold text-center text-gray-800 mb-8">Contact Us</h1>
    <div class="flex flex-col md:flex-row md:space-x-8">
      <!-- Contact Form -->
      <div class="flex-1 bg-white p-6 rounded-lg shadow mb-6 md:mb-0">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Get in Touch</h2>
        <form action="ContactServlet" method="post" class="space-y-4">
          <div>
            <label for="name" class="block text-gray-700 font-medium mb-1">
              <i class="fas fa-user mr-2"></i>Name
            </label>
            <input type="text" id="name" name="name" placeholder="Your Name" class="w-full border border-gray-300 rounded-lg p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
          </div>
          <div>
            <label for="email" class="block text-gray-700 font-medium mb-1">
              <i class="fas fa-envelope mr-2"></i>Email
            </label>
            <input type="email" id="email" name="email" placeholder="Your Email" class="w-full border border-gray-300 rounded-lg p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
          </div>
          <div>
            <label for="subject" class="block text-gray-700 font-medium mb-1">
              <i class="fas fa-tag mr-2"></i>Subject
            </label>
            <input type="text" id="subject" name="subject" placeholder="Subject" class="w-full border border-gray-300 rounded-lg p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
          </div>
          <div>
            <label for="message" class="block text-gray-700 font-medium mb-1">
              <i class="fas fa-comment mr-2"></i>Message
            </label>
            <textarea id="message" name="message" rows="5" placeholder="Your Message" class="w-full border border-gray-300 rounded-lg p-2 focus:outline-none focus:ring-2 focus:ring-blue-500" required></textarea>
          </div>
          <div>
            <input type="submit" value="Send Message" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 rounded-lg transition duration-300 cursor-pointer">
          </div>
        </form>
      </div>
      <!-- Contact Information -->
      <div class="flex-1 bg-white p-6 rounded-lg shadow">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Contact Information</h2>
        <p class="text-gray-600 mb-4">
          We are here to answer any questions you may have about our online car rental services. Reach out to us and we'll respond as soon as possible.
        </p>
        <ul class="space-y-4">
          <li class="flex items-center">
            <i class="fas fa-map-marker-alt text-blue-500 text-xl mr-3"></i>
            <span class="text-gray-700">1234 Suhada Mawatha, Kandy, Sri Lanka</span>
          </li>
          <li class="flex items-center">
            <i class="fas fa-phone text-blue-500 text-xl mr-3"></i>
            <span class="text-gray-700">+94 (234) 567-890</span>
          </li>
          <li class="flex items-center">
            <i class="fas fa-envelope text-blue-500 text-xl mr-3"></i>
            <span class="text-gray-700">support@rentora.com</span>
          </li>
          <li class="flex items-center">
            <i class="fas fa-clock text-blue-500 text-xl mr-3"></i>
            <span class="text-gray-700">Mon - Fri: 9:00 AM to 6:00 PM</span>
          </li>
        </ul>
      </div>
    </div>
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
