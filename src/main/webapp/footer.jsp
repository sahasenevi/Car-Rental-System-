<%@ page session="true" %>
<!-- Tailwind + FontAwesome -->
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://kit.fontawesome.com/48c2219736.js" crossorigin="anonymous"></script>

<footer class="bg-[#0f172a] text-gray-300 mt-16">
  <div class="max-w-7xl mx-auto px-6 py-12 grid grid-cols-1 md:grid-cols-4 gap-8">
    <!-- About Rentora -->
    <div>
      <h3 class="text-2xl font-bold text-white">Rentora</h3>
      <p class="mt-4 text-gray-400">
        Rentora offers a seamless online car rental experience with a wide range of vehicles to suit every journey.
      </p>
      <div class="mt-4 flex space-x-4 text-xl">
        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-twitter"></i></a>
        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-instagram"></i></a>
        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-linkedin-in"></i></a>
      </div>
    </div>

    <!-- Quick Links -->
    <div>
      <h4 class="text-xl font-semibold text-white mb-4">Quick Links</h4>
      <ul class="space-y-2">
        <li><a href="HomePage.jsp" class="hover:text-white transition">Home</a></li>
        <li><a href="AllVehicles.jsp" class="hover:text-white transition">Vehicles</a></li>
        <li><a href="aboutUs.jsp" class="hover:text-white transition">About</a></li>
        <li><a href="contact.jsp" class="hover:text-white transition">Contact</a></li>
      </ul>
    </div>

    <!-- Contact Info -->
    <div>
      <h4 class="text-xl font-semibold text-white mb-4">Contact Us</h4>
      <ul class="space-y-2 text-gray-400">
        <li><i class="fas fa-map-marker-alt mr-2 text-white"></i>1234 Street Name, City, Country</li>
        <li><i class="fas fa-phone mr-2 text-white"></i>+1 (234) 567-890</li>
        <li><i class="fas fa-envelope mr-2 text-white"></i>support@rentora.com</li>
      </ul>
    </div>

    <!-- Newsletter -->
    <div>
      <h4 class="text-xl font-semibold text-white mb-4">Newsletter</h4>
      <p class="text-gray-400 mb-4">
        Subscribe to get the latest updates and offers.
      </p>
      <form class="flex">
        <input type="email" placeholder="Enter your email" class="w-full px-3 py-2 rounded-l focus:outline-none text-gray-800" />
        <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 rounded-r transition">
          Subscribe
        </button>
      </form>
    </div>
  </div>

  <!-- Footer Bottom -->
  <div class="bg-[#1e293b] py-4 text-center text-sm text-gray-500">
    &copy; 2025 Rentora. All rights reserved.
  </div>
</footer>
