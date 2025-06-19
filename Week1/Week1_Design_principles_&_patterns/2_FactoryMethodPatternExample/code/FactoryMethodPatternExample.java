abstract class Document{
    public abstract void open();
}
abstract class DocumentFactory{
    public abstract Document createDocument();
}
public class FactoryMethodPatternExample {

    static class WordDocument extends Document{
        public void open(){
            System.out.println("Word document is opening...");
        }
    }
    static class PdfDocument extends Document{
        public void open(){
            System.out.println("Pdf document is opening...");
        }
    }
    static class ExcelDocument extends Document{
        public void open(){
            System.out.println("Excel document is opening...");
        }
    }

    static class WordDocumentFactory extends DocumentFactory{
        public Document createDocument(){
            return new WordDocument();
        }
    }
    static class ExcelDocumentFactory extends DocumentFactory{
        public Document createDocument(){
            return new ExcelDocument();
        }
    }
    static class PdfDocumentFactory extends DocumentFactory{
        public Document createDocument(){
            return new PdfDocument();
        }
    }

    
    public static void main(String[] args) {
        //Word file creation
        WordDocumentFactory word = new WordDocumentFactory();
        Document doc = word.createDocument();
        doc.open();
        //Excel file creation
        ExcelDocumentFactory excel = new ExcelDocumentFactory();
        Document excelfile = excel.createDocument();
        excelfile.open();
        //Pdf file creation
        PdfDocumentFactory pdf = new PdfDocumentFactory();
        Document pdffile = pdf.createDocument();
        pdffile.open();
    }    
}
