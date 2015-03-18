
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nick
 */
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Data.rootPath = getServletContext().getRealPath("/data/");

            Input.init(request);

            Output.init();

            Output.run();

            request.setAttribute("title", Output.title);
            request.setAttribute("values", Output.valueList);
            request.setAttribute("invalidGenes", Output.invalidGeneList);
            request.setAttribute("genes", Input.inputGeneList);
            request.setAttribute("isAllGene", Input.isAllGene);
            request.setAttribute("titleSet", Input.titleSet);
            request.setAttribute("isSelectAll", Input.isSelectAll);
            request.setAttribute("download", Output.url);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
//            ErrorManager.send(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
