<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome CDN -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">

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
                <a href="cars.jsp" class="text-gray-800 hover:text-blue-600 transition">Cars</a>
                <a href="aboutUs.jsp" class="text-gray-800 hover:text-blue-600 transition">About</a>
                <a href="contact.jsp" class="text-gray-800 hover:text-blue-600 transition">Contact</a>
                <a href="Login.jsp" class="text-gray-800 hover:text-blue-600 transition">
                    <i class="fas fa-user-circle fa-2x"></i>
                </a>
            </div>
        </div>
    </header>

    <!-- Main Profile Section -->
    <main class="flex-grow flex items-center justify-center py-12 px-6 bg-gradient-to-r from-blue-50 to-indigo-50">

        <c:forEach var="admin" items="${Admin_Details}">

            <c:set var="id" value="${admin.adminId}"/>
            <c:set var="name" value="${admin.name}"/>
            <c:set var="email" value="${admin.email}"/>
            <c:set var="phone" value="${admin.phone}"/>
            <c:set var="userName" value="${admin.userName}"/>
            <c:set var="password" value="${admin.password}"/>

            <div class="bg-white shadow-2xl rounded-3xl p-10 max-w-md w-full border border-gray-100 transition transform hover:scale-105">

                <!-- Profile Avatar -->
                <div class="flex flex-col items-center mb-8">
                    <div class="w-24 h-24 rounded-full bg-indigo-100 text-indigo-600 flex items-center justify-center text-4xl font-bold mb-4 shadow-md">
                        ${admin.name.substring(0,1)}
                    </div>
                    <h2 class="text-2xl font-bold text-gray-800">${admin.name}</h2>
                    <p class="text-sm text-gray-500">@${admin.userName}</p>
                </div>

                <!-- Details -->
                <div class="space-y-4 text-gray-700">
                    <div>
                        <p class="text-xs text-gray-500 uppercase">Admin ID</p>
                        <p class="font-semibold text-lg">${admin.adminId}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500 uppercase">Email</p>
                        <p class="font-semibold text-lg">${admin.email}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500 uppercase">Phone</p>
                        <p class="font-semibold text-lg">${admin.phone}</p>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="mt-8 space-y-4">

                    <!-- Update Button -->
                    <c:url value="adminUpdate.jsp" var="adminUpdate">
                        <c:param name="id">${id}</c:param>
                        <c:param name="name">${name}</c:param>
                        <c:param name="email">${email}</c:param>
                        <c:param name="phone">${phone}</c:param>
                        <c:param name="userName">${userName}</c:param>
                        <c:param name="password">${password}</c:param>
                    </c:url>

                    <a href="${adminUpdate}" class="block text-center bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 px-6 rounded-full shadow-md transition duration-300">
                        Update Profile
                    </a>

                    <!-- Delete Button -->
                    <c:url value="adminDelete.jsp" var="adminDelete">
                        <c:param name="id">${id}</c:param>
                        <c:param name="name">${name}</c:param>
                        <c:param name="email">${email}</c:param>
                        <c:param name="phone">${phone}</c:param>
                        <c:param name="userName">${userName}</c:param>
                        <c:param name="password">${password}</c:param>
                    </c:url>

                    <a href="${adminDelete}" onclick="return confirm('Are you sure you want to delete your account?');" class="block text-center bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-6 rounded-full shadow-md transition duration-300">
                        Delete My Account
                    </a>

                </div>

            </div>

        </c:forEach>

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
                        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-gray-400 hover:text-white transition"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <!-- Quick Links -->
                <div>
                    <h4 class="text-xl font-semibold text-white mb-4">Quick Links</h4>
                    <ul>
                        <li class="mb-2"><a href="index.jsp" class="hover:text-white transition">Home</a></li>
                        <li class="mb-2"><a href="cars.jsp" class="hover:text-white transition">Cars</a></li>
                        <li class="mb-2"><a href="about.jsp" class="hover:text-white transition">About</a></li>
                        <li class="mb-2"><a href="contact.jsp" class="hover:text-white transition">Contact</a></li>
                        <li class="mb-2"><a href="allCustomers.jsp" class="hover:text-white transition">All Customers</a></li>
                    </ul>
                </div>
                <!-- Contact Info -->
                <div>
                    <h4 class="text-xl font-semibold text-white mb-4">Contact Us</h4>
                    <p class="mb-2"><i class="fas fa-map-marker-alt mr-2"></i>1234 Street Name, City, Country</p>
                    <p class="mb-2"><i class="fas fa-phone mr-2"></i>+1 (234) 567-890</p>
                    <p class="mb-2"><i class="fas fa-envelope mr-2"></i>support@rentora.com</p>
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
