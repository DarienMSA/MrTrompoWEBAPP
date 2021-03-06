/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.controllers;

import com.mycompany.mrtrompoweb.dao.categoryDAO;
import com.mycompany.mrtrompoweb.dao.pedidoDAO;
import com.mycompany.mrtrompoweb.dao.productsDAO;
import com.mycompany.mrtrompoweb.models.category;
import com.mycompany.mrtrompoweb.models.pedido;
import com.mycompany.mrtrompoweb.models.products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 52811
 */
@WebServlet(name = "MenuController", urlPatterns = {"/MenuController"})
public class MenuController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MenuController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MenuController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String categoria = request.getParameter("categoria");
        List<products> menuProducts = productsDAO.getProductsByCategory(categoria);
        request.setAttribute("menuProducts", menuProducts);
        
        
        category categoriaActual = categoryDAO.getCategory(categoria);
        request.setAttribute("categoriaActual", categoriaActual);
         
        String emailActual = (String)session.getAttribute("emailActual");
        if(emailActual == null){
            emailActual = "null";
        }
        List<pedido> pedidosActivosCategoria = pedidoDAO.showActivePedidosbyCategory(categoria, emailActual);
        request.setAttribute("pedidosActivosCategoria", pedidosActivosCategoria);
        
    
        
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
