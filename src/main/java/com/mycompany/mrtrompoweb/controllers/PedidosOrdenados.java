/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.controllers;

import com.google.gson.Gson;
import com.mycompany.mrtrompoweb.dao.pedidoDAO;
import com.mycompany.mrtrompoweb.dao.productsDAO;
import com.mycompany.mrtrompoweb.models.pedido;
import com.mycompany.mrtrompoweb.models.products;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 52811
 */
@WebServlet(name = "PedidosOrdenados", urlPatterns = {"/PedidosOrdenados"})
public class PedidosOrdenados extends HttpServlet {

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
            out.println("<title>Servlet PedidosOrdenados</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PedidosOrdenados at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        int index = Integer.parseInt(request.getParameter("columna"));
        int orden = Integer.parseInt(request.getParameter("orden"));
        List<pedido> pedidos;
        if(orden == 1){
            pedidos = pedidoDAO.getPedidosOrderByColNumASC(index);
        }else{
            pedidos = pedidoDAO.getPedidosOrderByColNumDESC(index);
        }
        
        byte[] bytes;
        int tamaño = pedidos.size();
        for(int i = 0; i < tamaño; i++){
        bytes = pedidos.get(i).getUserEmail().getBytes(StandardCharsets.UTF_8);
        pedidos.get(i).setUserEmail(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidos.get(i).getCategoria().getBytes(StandardCharsets.UTF_8);
        pedidos.get(i).setCategoria(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidos.get(i).getComentario().getBytes(StandardCharsets.UTF_8);
        pedidos.get(i).setComentario(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidos.get(i).getUserNombre().getBytes(StandardCharsets.UTF_8);
        pedidos.get(i).setUserNombre(new String(bytes, StandardCharsets.ISO_8859_1));
        }
        
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(pedidos));
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
