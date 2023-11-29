package Projetos.Rpg.src;
public enum Racas {
    //Enumeração das raças
    HUMANO("Humano", 5*3, 5,5, 0),
    ELFO("Elfo", 3*2, 5,7, 0),
    ORC("Orc", 7*3, 6,2, 0),
    GOBLIN("Goblin",4*3,5,6, 3),
    LOBO("Lobo",5*3,5,5, 2),
    SLIME("Slime",9*3,3,3, 1);

    //Atributos que toda raça possui
    private String nomeRaca;
    private int hpBase;
    private int stregthBase;
    private int speedBase;
    private double expDrop;

    //Construtor da Raça, onde cada raça é criada com atributos especificos
    Racas(String nome, int hp, int atk, int speed,double expDrop) {
        this.nomeRaca = nome;
        this.hpBase = hp;
        this.stregthBase = atk;
        this.speedBase = speed;
        this.expDrop = expDrop;
    }
    //Metodos da raca
    public String getNome() {
        return nomeRaca;
    }

    public int getHpBase() {
        return hpBase;
    }

    public int getStrengthBase() {
        return stregthBase;
    }

    public int getSpeedBase() {
        return speedBase;
    }

    public double getExpDrop() {return expDrop;}
}