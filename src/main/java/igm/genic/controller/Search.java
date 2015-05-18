package igm.genic.controller;


import igm.genic.model.Output;
import igm.genic.model.Input;
import igm.genic.model.Download;
import igm.genic.global.Data;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nick
 */
public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Data.rootPath = getServletContext().getRealPath("/data/");
            Download.rootPath = getServletContext().getRealPath("/download/");

            Input.init(request);

            Output.init();

            Download.init();
            
            Download.generateFile();

            request.setAttribute("geneList", Output.geneList);
            request.setAttribute("invalidGenes", Input.invalidGeneList);
            request.setAttribute("query", Input.query);     
            request.setAttribute("url", Download.url);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
