package object;

/**
 *
 * @author nick
 */
public class Gene {

    public static final String title
            = "GENE,"
            + "ALL_0.1%,"
            + "OEratio,"
            + "%ExAC_0.05%popn,"
            + "OEratio-percentile[ExAC],"
            + "LoF-FDR[ExAC],"
            + "ExAC_v2_0.05%popn,"
            + "Edge Case (ExAC_v2),"
            + "OEratio-percentile[ExAC_v2]";

    public String Gene;
    public String ALL_01_Value;
    public String ALL_01_Percent;
    public String OEratio_Percent;
    public String ExAC_005_Popn_Percent;
    public String OEratio_Percentile_ExAC;
    public String LoF_FDR_ExAC;
    public String ExAC_v2_005_Popn_value;
    public String ExAC_v2_005_Popn_Percent;
    public String Edge_Case_ExAC_v2;
    public String OEratio_percentile_ExAC_v2;

    public String getGene() {
        return Gene;
    }

    public String getALL_01() {
        return ALL_01_Value + " (" + ALL_01_Percent + ")";
    }

    public String getOEratio() {
        return OEratio_Percent;
    }

    public String getExAC_005_Popn_Percent() {
        return ExAC_005_Popn_Percent;
    }

    public String getOEratio_Percentile_ExAC() {
        return OEratio_Percentile_ExAC;
    }

    public String getLoF_FDR_ExAC() {
        return LoF_FDR_ExAC;
    }

    public String getExAC_v2_005_Popn() {
        return ExAC_v2_005_Popn_value + " (" + ExAC_v2_005_Popn_Percent + ")";
    }

    public String getEdge_Case_ExAC_v2() {
        return Edge_Case_ExAC_v2;
    }

    public String getOEratio_percentile_ExAC_v2() {
        return OEratio_percentile_ExAC_v2;
    }

    public String getEdge_Case_OERatio_percentile_ExAC_v2() {
        return Edge_Case_ExAC_v2 + " (" + OEratio_percentile_ExAC_v2 + ")";
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append(getGene()).append(",");
        sb.append(getALL_01()).append(",");
        sb.append(getOEratio()).append(",");
        sb.append(getExAC_005_Popn_Percent()).append(",");
        sb.append(getOEratio_Percentile_ExAC()).append(",");
        sb.append(getLoF_FDR_ExAC()).append(",");
        sb.append(getExAC_v2_005_Popn()).append(",");
        sb.append(getEdge_Case_ExAC_v2()).append(",");
        sb.append(getOEratio_percentile_ExAC_v2());

        return sb.toString();
    }
}
