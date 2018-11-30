package page;

public class car {
    private String username;
    private int category_id;
    private String bookname;
    private double price;
    private int quantity;
    public car(){
    }
    public void setUsername( String username){
        this.username=username;
    }
    public void setCategory_id(int category_id){
        this.category_id=category_id;
    }
    public void setBookname( String bookname){
        this.bookname=bookname;
    }
    public void setPrice( double price){
        this.price=price;
    }
    public void setQuantity( int quantity){
        this.quantity=quantity;
    }

    public String getUsername(){
        return username;
    }
    public int getCategory_id(){
        return category_id;
    }
    public String getBookname(){
        return bookname;
    }
    public double getPrice(){
        return price;
    }
    public int getQuantity(){
        return quantity;
    }

}
