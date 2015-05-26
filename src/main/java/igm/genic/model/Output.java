package igm.genic.model;

import igm.genic.object.Gene;
import igm.genic.global.Data;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author nick
 */
public class Output {

    public static ArrayList<Gene> geneList;
    private static HashMap<String, Gene> geneMap;

    public static void init() throws Exception {
        geneList = new ArrayList<Gene>();

        geneMap = new HashMap<String, Gene>();

        initOutputList();
    }

    private static void initOutputList() throws Exception {
        File file = new File(Data.rootPath + File.separator + Data.INPUT_DATA);
        FileInputStream fstream = new FileInputStream(file);
        DataInputStream in = new DataInputStream(fstream);
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        String line;

        while ((line = br.readLine()) != null) {
            String[] temp = line.split(Data.TAB);

            temp[0] = temp[0].toUpperCase();

            if (Input.geneNameList.contains(temp[0])) {
                Gene gene = new Gene();
                gene.Gene = temp[0];
                gene.ALL_001_value = temp[1];
                gene.ALL_001_Percent = temp[2];
                gene.ALL_01_value = temp[3];
                gene.ALL_01_Percent = temp[4];
                gene.ALL_1_value = temp[5];
                gene.ALL_1_Percent = temp[6];
                gene.PP2_ALL_01_value = temp[7];
                gene.PP2_ALL_01_Percent = temp[8];
                gene.EA_01_value = temp[9];
                gene.EA_01_Percent = temp[10];
                gene.EA_1_value = temp[11];
                gene.EA_1_Percent = temp[12];
                gene.AA_01_value = temp[13];
                gene.AA_01_Percent = temp[14];
                gene.AA_1_value = temp[15];
                gene.AA_1_Percent = temp[16];
                gene.OEratio_value = temp[17];
                gene.OEratio_Percent = temp[18];
                gene.ExAC_01_Popn_Percent = temp[19];
                gene.ExAC_005_Popn_Percent = temp[20];
                gene.ExAC_001_Percent = temp[21];

                geneMap.put(gene.Gene, gene);
            }
        }

        // generate gene list base on user input order
        for (String geneName : Input.geneNameList) {
            Gene gene = geneMap.get(geneName);
            if (gene != null) {
                Output.geneList.add(gene);
            }
        }
    }
}
