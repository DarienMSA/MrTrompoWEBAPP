/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.controllers;

import com.google.gson.Gson;
import com.mycompany.mrtrompoweb.dao.pedidoDAO;
import com.mycompany.mrtrompoweb.models.pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author 52811
 */
@WebServlet(name = "MostrarOrden", urlPatterns = {"/MostrarOrden"})
public class MostrarOrden extends HttpServlet {

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
            out.println("<title>Servlet MostrarOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MostrarOrden at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        int idOrden = Integer.parseInt(request.getParameter("idOrden"));
        List<pedido> pedidoOrden = pedidoDAO.getPedidosByOrden(idOrden);
        byte[] bytes;
        int tamaño = pedidoOrden.size();
        for(int i = 0; i < tamaño; i++){
        bytes = pedidoOrden.get(i).getNombre_prod().getBytes(StandardCharsets.UTF_8);
        pedidoOrden.get(i).setNombre_prod(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidoOrden.get(i).getCategoria().getBytes(StandardCharsets.UTF_8);
        pedidoOrden.get(i).setCategoria(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidoOrden.get(i).getDescripcion().getBytes(StandardCharsets.UTF_8);
        pedidoOrden.get(i).setDescripcion(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidoOrden.get(i).getComentario().getBytes(StandardCharsets.UTF_8);
        pedidoOrden.get(i).setComentario(new String(bytes, StandardCharsets.ISO_8859_1));
        
        bytes = pedidoOrden.get(i).getImagen().getBytes(StandardCharsets.UTF_8);
        pedidoOrden.get(i).setImagen(new String(bytes, StandardCharsets.ISO_8859_1));
        }
        Gson gson = new Gson();
        String prueba = gson.toJson(pedidoOrden);
        out.print(gson.toJson(pedidoOrden));

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
