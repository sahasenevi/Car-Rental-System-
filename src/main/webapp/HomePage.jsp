<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="VehicleController.VehicleModel, VehicleController.Vehicle, java.util.*" %>
<%@ page import="OfferController.OfferModel, OfferController.Offer" %>
<%@ page session="true" %>

<%
    List<Vehicle> latestVehicles = VehicleModel.getLatestVehicles(4); // Fetch 4 vehicles
    List<Offer> offers = OfferModel.getLatestOffers(4); // Fetch 4 offers
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Online Vehicle Rental - Home</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/48c2219736.js" crossorigin="anonymous"></script>
  <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
  <style>[x-cloak] { display: none !important; }</style>
</head>
<body class="bg-gray-100 text-gray-800">

<%@ include file="header.jsp" %>

<!-- Hero Section -->
<section x-data="carousel()" class="relative w-full h-[600px] overflow-hidden">
  <template x-for="(slide, index) in slides" :key="index">
    <div x-show="activeSlide === index" x-cloak
         class="absolute inset-0 transition-opacity duration-700"
         x-transition:enter="opacity-0" x-transition:enter-end="opacity-100"
         x-transition:leave="opacity-100" x-transition:leave-end="opacity-0">
      <img :src="slide.image" class="w-full h-full object-cover" alt="">
      <div class="absolute inset-0 bg-black bg-opacity-40"></div>
      <div class="absolute inset-0 flex items-center px-12">
        <div class="text-white max-w-xl">
          <h2 class="text-4xl font-bold mb-4" x-text="slide.title"></h2>
          <p class="text-lg" x-text="slide.description"></p>
        </div>
      </div>
    </div>
  </template>

  <button @click="prevSlide" class="absolute top-1/2 left-4 transform -translate-y-1/2 text-white text-2xl bg-black bg-opacity-30 p-2 rounded-full hover:bg-opacity-50">
    <i class="fas fa-chevron-left"></i>
  </button>
  <button @click="nextSlide" class="absolute top-1/2 right-4 transform -translate-y-1/2 text-white text-2xl bg-black bg-opacity-30 p-2 rounded-full hover:bg-opacity-50">
    <i class="fas fa-chevron-right"></i>
  </button>
</section>
<script>
  function carousel() {
    return {
      activeSlide: 0,
      slides: [
        { image: 'images/banner1.jpeg', title: 'Exclusive Car Rentals', description: 'Choose from a wide variety of premium vehicles.' },
        { image: 'images/banner2.jpg', title: 'Affordable Prices', description: 'Great deals and flexible rental plans for everyone.' },
        { image: 'images/banner3.jpeg', title: 'Your Journey Starts Here', description: 'Rent and drive with confidence and comfort.' }
      ],
      init() { setInterval(() => this.nextSlide(), 5000); },
      prevSlide() { this.activeSlide = (this.activeSlide === 0) ? this.slides.length - 1 : this.activeSlide - 1; },
      nextSlide() { this.activeSlide = (this.activeSlide === this.slides.length - 1) ? 0 : this.activeSlide + 1; }
    }
  }
</script>

<!-- Featured Cars -->
<section class="py-12">
  <div class="container mx-auto px-6">
    <h2 class="text-3xl font-bold text-center mb-8">Featured Cars</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
      <% for (Vehicle v : latestVehicles) { %>
        <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition">
          <% if (v.getImage() != null && !v.getImage().isEmpty()) { %>
            <img src="uploads/<%= v.getImage() %>" class="w-full h-40 object-cover">
          <% } else { %>
            <div class="w-full h-40 bg-gray-300 flex items-center justify-center">No Image</div>
          <% } %>
          <div class="p-4">
            <h3 class="text-lg font-bold mb-2"><%= v.getVname() %></h3>
            <p class="text-gray-700 mb-2">Rs. <%= v.getPrice() %>/day</p>
            <div class="flex justify-between">
              <form method="post" action="CheckBookingAccessServlet">
                <input type="hidden" name="vid" value="<%= v.getVid() %>">
                <button class="bg-blue-500 hover:bg-blue-600 text-white py-1 px-3 rounded">Book Now</button>
              </form>
              <button onclick="openModal('<%= v.getVname() %>', '<%= v.getVbrand() %>', '<%= v.getFuel() %>', <%= v.getSeatno() %>, <%= v.getPrice() %>, '<%= v.getImage() %>')" class="bg-green-500 hover:bg-green-600 text-white py-1 px-3 rounded">Quick View</button>
            </div>
          </div>
        </div>
      <% } %>
    </div>
    <div class="text-center mt-6">
      <a href="AllVehicles.jsp" class="bg-gray-800 text-white px-6 py-2 rounded hover:bg-gray-700">View All Vehicles</a>
    </div>
  </div>
</section>





<!-- How It Works Section -->
  <section class="py-12 bg-white">
    <div class="container mx-auto px-6">
      <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">How It Works</h2>
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
        <!-- Step 1: Select Car -->
        <div class="flex flex-col items-center text-center p-4 transform transition duration-300 hover:scale-105 hover:shadow-xl group">
          <div class="bg-blue-100 p-4 rounded-full mb-4 transition duration-300 group-hover:bg-blue-200">
            <i class="fas fa-car-side fa-2x text-blue-600"></i>
          </div>
          <h3 class="text-xl font-semibold text-gray-700 mb-2 transition duration-300 group-hover:text-blue-600">Select Car</h3>
          <p class="text-gray-600">Browse our wide range of vehicles and choose the one that fits your style.</p>
        </div>
        <!-- Step 2: Book Car -->
        <div class="flex flex-col items-center text-center p-4 transform transition duration-300 hover:scale-105 hover:shadow-xl group">
          <div class="bg-green-100 p-4 rounded-full mb-4 transition duration-300 group-hover:bg-green-200">
            <i class="fas fa-calendar-check fa-2x text-green-600"></i>
          </div>
          <h3 class="text-xl font-semibold text-gray-700 mb-2 transition duration-300 group-hover:text-green-600">Book Car</h3>
          <p class="text-gray-600">Reserve your chosen car easily with our quick online booking system.</p>
        </div>
        <!-- Step 3: Make Payment -->
        <div class="flex flex-col items-center text-center p-4 transform transition duration-300 hover:scale-105 hover:shadow-xl group">
          <div class="bg-yellow-100 p-4 rounded-full mb-4 transition duration-300 group-hover:bg-yellow-200">
            <i class="fas fa-credit-card fa-2x text-yellow-600"></i>
          </div>
          <h3 class="text-xl font-semibold text-gray-700 mb-2 transition duration-300 group-hover:text-yellow-600">Make Payment</h3>
          <p class="text-gray-600">Enjoy secure and flexible payment options.</p>
        </div>
        <!-- Step 4: Pick Up & Drive -->
        <div class="flex flex-col items-center text-center p-4 transform transition duration-300 hover:scale-105 hover:shadow-xl group">
          <div class="bg-red-100 p-4 rounded-full mb-4 transition duration-300 group-hover:bg-red-200">
            <i class="fas fa-road fa-2x text-red-600"></i>
          </div>
          <h3 class="text-xl font-semibold text-gray-700 mb-2 transition duration-300 group-hover:text-red-600">Pick Up & Drive</h3>
          <p class="text-gray-600">Collect your car and start your journey with ease and comfort.</p>
        </div>
      </div>
    </div>
  </section>
  
  
  
  
  
  
  

<!-- Current Offers -->
<section class="py-12 bg-gray-50">
  <div class="container mx-auto px-6">
    <h2 class="text-3xl font-bold text-center mb-8">Current Offers</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
      <% for (Offer o : offers) { %>
        <div class="bg-white rounded-lg shadow-md p-4 hover:shadow-xl transition">
          <% if (o.getImage() != null && !o.getImage().isEmpty()) { %>
            <img src="uploads/offer/<%= o.getImage() %>" class="w-full h-40 object-cover rounded">
          <% } else { %>
            <div class="w-full h-40 bg-gray-300 flex items-center justify-center rounded">No Image</div>
          <% } %>
          <h3 class="mt-3 text-lg font-bold"><%= o.getTitle() %></h3>
          <p class="text-gray-600 text-sm"><%= o.getDescription() %></p>
          <p class="text-sm font-semibold mt-2">Discount: <%= o.getDiscount() %>%</p>
          <p class="text-sm font-semibold">Valid Until: <%= o.getValidUntil() %></p>
        </div>
      <% } %>
    </div>
    <div class="text-center mt-6">
      <a href="AllOffers.jsp" class="bg-gray-800 text-white px-6 py-2 rounded hover:bg-gray-700">View All Offers</a>
    </div>
  </div>
</section>



 <!-- FAQ Section -->
  <section class="py-12 bg-gray-100">
    <div class="container mx-auto px-6">
      <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">Frequently Asked Questions</h2>
      <div x-data="{ openIndex: null }" class="space-y-4">
        <!-- FAQ Item 1 -->
        <div class="border rounded-lg overflow-hidden">
          <button 
            @click="openIndex === 1 ? openIndex = null : openIndex = 1" 
            class="w-full px-4 py-3 text-left flex justify-between items-center bg-white hover:bg-gray-50 transition"
          >
            <span class="font-semibold text-gray-700">What is Rentora?</span>
            <i class="fas" :class="openIndex === 1 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
          </button>
          <div x-show="openIndex === 1" x-cloak x-transition class="px-4 py-3 text-gray-600 bg-gray-50">
            Rentora is an online car rental platform that allows users to browse, book, and manage car rentals with ease.
          </div>
        </div>
        <!-- FAQ Item 2 -->
        <div class="border rounded-lg overflow-hidden">
          <button 
            @click="openIndex === 2 ? openIndex = null : openIndex = 2" 
            class="w-full px-4 py-3 text-left flex justify-between items-center bg-white hover:bg-gray-50 transition"
          >
            <span class="font-semibold text-gray-700">How can I book a car?</span>
            <i class="fas" :class="openIndex === 2 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
          </button>
          <div x-show="openIndex === 2" x-cloak x-transition class="px-4 py-3 text-gray-600 bg-gray-50">
            You can book a car by selecting your desired vehicle, choosing your rental dates, and completing the booking process online.
          </div>
        </div>
        <!-- FAQ Item 3 -->
        <div class="border rounded-lg overflow-hidden">
          <button 
            @click="openIndex === 3 ? openIndex = null : openIndex = 3" 
            class="w-full px-4 py-3 text-left flex justify-between items-center bg-white hover:bg-gray-50 transition"
          >
            <span class="font-semibold text-gray-700">What payment methods are accepted?</span>
            <i class="fas" :class="openIndex === 3 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
          </button>
          <div x-show="openIndex === 3" x-cloak x-transition class="px-4 py-3 text-gray-600 bg-gray-50">
            We accept various payment methods, including major credit cards, debit cards, and online payment platforms.
          </div>
        </div>
        <!-- FAQ Item 4 -->
        <div class="border rounded-lg overflow-hidden">
          <button 
            @click="openIndex === 4 ? openIndex = null : openIndex = 4" 
            class="w-full px-4 py-3 text-left flex justify-between items-center bg-white hover:bg-gray-50 transition"
          >
            <span class="font-semibold text-gray-700">Can I cancel my booking?</span>
            <i class="fas" :class="openIndex === 4 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
          </button>
          <div x-show="openIndex === 4" x-cloak x-transition class="px-4 py-3 text-gray-600 bg-gray-50">
            Yes, you can cancel your booking according to our cancellation policy. Please check the terms and conditions for more details.
          </div>
        </div>
      </div>
    </div>
  </section>
  
<%@ include file="footer.jsp" %>




<!-- Vehicle Quick View Modal -->
<div id="vehicleModal" class="fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center hidden z-50">
  <div class="bg-white p-6 rounded-lg w-11/12 max-w-xl relative">
    <button onclick="closeModal()" class="absolute top-3 right-4 text-2xl font-bold">&times;</button>
    <h2 id="modalTitle" class="text-2xl font-bold mb-4"></h2>
    <img id="modalImage" src="" alt="Vehicle Image" class="w-full h-48 object-cover mb-4 rounded">
    <p><strong>Brand:</strong> <span id="modalBrand"></span></p>
    <p><strong>Fuel:</strong> <span id="modalFuel"></span></p>
    <p><strong>Seats:</strong> <span id="modalSeats"></span></p>
    <p><strong>Price:</strong> Rs. <span id="modalPrice"></span>/day</p>
  </div>
</div>

<script>
function openModal(vname, vbrand, fuel, seatno, price, image) {
  document.getElementById("modalTitle").innerText = vname;
  document.getElementById("modalBrand").innerText = vbrand;
  document.getElementById("modalFuel").innerText = fuel;
  document.getElementById("modalSeats").innerText = seatno;
  document.getElementById("modalPrice").innerText = price;
  document.getElementById("modalImage").src = "uploads/" + image;
  document.getElementById("vehicleModal").classList.remove("hidden");
}
function closeModal() {
  document.getElementById("vehicleModal").classList.add("hidden");
}
</script>

</body>
</html>