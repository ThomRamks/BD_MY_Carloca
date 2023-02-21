package carloca.core;

import carloca.entities.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Scanner;


public class Carloca {
    private static final Carloca carloca = new Carloca();

    private Carloca() {

    }

    public static Carloca getInstance() {
        return carloca;
    }

    public static void Iniciar() {
        menuInicial(obterSessao());
    }

    private static void menuInicial(Session session) {
        System.out.println("===================== CARLOCA ====================== \n");
        Scanner input = new Scanner(System.in);
        System.out.println(
                "Qual opção deseja selecionar:\n"
                        + "1 - Cadastrar Cliente \n"
                        + "2 - Visualizar Carros \n"
                        + "3 - Registrar Locação \n"
                        + "4 - Registrar Devolução \n"
                        + "5 - Consultar Histórico de Locações \n"
                        + "6 - Sair");
        String resposta = input.next();
        switch (resposta) {
            case "1":
                createCliente(session);
                menuInicial(session);
                break;
            case "2":
                checkCarros(session);
                menuInicial(session);
                break;
            case "3":
                newLocacao(session);
                menuInicial(session);
                break;
            case "4":
                newDevolucao(session);
                menuInicial(session);
                break;
            case "5":
                showHistorico(session);
                menuInicial(session);
                break;
            case "6":
                System.exit(0);
            default:
                System.out.println("Operação inválida. Tente novamente.");
                menuInicial(session);
                break;

        }
    }

    private static Session obterSessao() {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");
        configuration.addAnnotatedClass(Carro.class);
        configuration.addAnnotatedClass(Cliente.class);
        configuration.addAnnotatedClass(DadosDevolucao.class);
        configuration.addAnnotatedClass(DadosLocacao.class);
        configuration.addAnnotatedClass(Endereco.class);
        configuration.addAnnotatedClass(HistoricoLocacoes.class);
        configuration.addAnnotatedClass(Opcionais.class);
        configuration.addAnnotatedClass(StatusCarro.class);
        configuration.addAnnotatedClass(TipoCarro.class);
        configuration.addAnnotatedClass(UnidadeCarloca.class);

        SessionFactory sessionFactory = configuration.buildSessionFactory();

        Session session = sessionFactory.openSession();
        return session;
    }

    private static void createCliente(Session session) {
        Cliente cliente = new Cliente();
        Scanner input = new Scanner(System.in);
        System.out.println("Nome do Cliente: ");
        String nome = input.nextLine();
        cliente.setNome(nome);
        cliente.setEndereco(createEndereco(session));
        System.out.println("Data de Nascimento: ");
        String data = input.nextLine();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date = LocalDate.parse(data, format);
        cliente.setNascimento(date);
        System.out.println("CPF: ");
        String CPF = input.nextLine();
        cliente.setCPF(CPF);
        System.out.println("CNH: ");
        String CNH = input.nextLine();
        cliente.setCNH(CNH);
        System.out.println("Telefone: ");
        Integer telefone = input.nextInt();
        cliente.setTelefone(telefone);
        System.out.println("E-Mail: ");
        String email = input.nextLine();
        cliente.setEmail(email);
        session.save(cliente);
        session.beginTransaction();
        session.getTransaction().commit();
        System.out.println("Cliente cadastrado.");
    }

    private static Endereco createEndereco(Session session) {
        Endereco endereco = new Endereco();
        Scanner input = new Scanner(System.in);
        System.out.println("Logradouro: ");
        String logradouro = input.nextLine();
        endereco.setLogradouro(logradouro);
        System.out.println("CEP: ");
        String CEP = input.nextLine();
        endereco.setCEP(CEP);
        System.out.println("Numero: ");
        String numero = input.nextLine();
        endereco.setNumero(numero);
        System.out.println("Complemento: ");
        String complemento = input.nextLine();
        endereco.setComplemento(complemento);
        System.out.println("Cidade: ");
        String cidade = input.nextLine();
        endereco.setCidade(cidade);
        System.out.println("Estado: ");
        String estado = input.nextLine();
        endereco.setEstado(estado);
        System.out.println("Pais: ");
        String pais = input.nextLine();
        endereco.setPais(pais);
        session.save(endereco);
        session.beginTransaction();
        session.getTransaction().commit();
        return endereco;
    }

    private static void checkCarros(Session session) {
        List<StatusCarro> carros = session.createQuery("from StatusCarro").getResultList();
        carros.forEach(carro -> {
            System.out.println("\nCarro: " + carro.getIdCarro() + " Situação: " + carro.getSituacao());
        });
    }

    private static void newLocacao(Session session) {
        DadosLocacao locacao = new DadosLocacao();
        Scanner input = new Scanner(System.in);
        System.out.println("Digite o CPF do Cliente: ");
        String CPF = input.nextLine();
        Cliente cliente = (Cliente) session.createQuery("from Cliente where CPF =: CPF").setParameter("CPF", CPF).getSingleResult();
        System.out.println("Digite o ID do Veículo a ser locado: ");
        Integer idCarro = input.nextInt();
        Carro carro = (Carro) session.createQuery("from Carro where id =: id").setParameter("id", idCarro).getSingleResult();
        LocalDate date = getDate();
        System.out.println("Qual o local de retirada do veículo?");
        UnidadeCarloca unidade = getUnidade(session);
        locacao.setIdCliente(cliente);
        locacao.setIdCarro(carro);
        locacao.setDataInicio(date);
        locacao.setIdUnidadeCarlocaOrigem(unidade);
        locacao.setSituacao("ABERTO");
        session.save(locacao);
        session.beginTransaction();
        session.getTransaction().commit();
        System.out.println("Locação registrada.");
    }

    private static UnidadeCarloca getUnidade(Session session) {
        Scanner input = new Scanner(System.in);
        List<UnidadeCarloca> unidades = session.createQuery("from UnidadeCarloca").getResultList();
        unidades.forEach(unidade -> {
            System.out.println("Unidade: " + unidade.getNomeUnidade() + " - " + unidade.getIdEndereco() + " - ID: " + unidade.getId());
        });
        System.out.println("\nDigite o ID da unidade: ");
        Integer id = input.nextInt();
        UnidadeCarloca unidadeEscolhida = (UnidadeCarloca) session.createQuery("from UnidadeCarloca where id =: id").setParameter("id", id).getSingleResult();
        return unidadeEscolhida;
    }

    private static LocalDate getDate() {
        Scanner input = new Scanner(System.in);
        System.out.println("Digite a data de hoje: ");
        String data = input.nextLine();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date = LocalDate.parse(data, format);
        return date;
    }

    private static void newDevolucao(Session session) {
        Scanner input = new Scanner(System.in);
        DadosDevolucao devolucao = new DadosDevolucao();
        DadosLocacao locacao = getLocacao(session);
        LocalDate date = getDate();
        System.out.println("Qual o local de devolução do veículo?");
        UnidadeCarloca unidade = getUnidade(session);
        System.out.println("Qual a KM atual do veículo?");
        Integer kmAtual = input.nextInt();
        devolucao.setIdDadosLocacao(locacao);
        devolucao.setDataFim(date);
        devolucao.setIdUnidadeCarlocaFim(unidade);
        devolucao.setKmAtual(kmAtual);
        session.save(devolucao);
        session.beginTransaction();
        session.getTransaction().commit();
        System.out.println("Devolução registrada.");
    }

    private static DadosLocacao getLocacao(Session session) {
        Scanner input = new Scanner(System.in);
        List<DadosLocacao> locacoes = session.createQuery("from DadosLocacao").getResultList();
        System.out.println("Digite o CPF do Cliente: ");
        String CPF = input.nextLine();
        for (DadosLocacao locacao : locacoes) {
            if (locacao.getIdCliente().getCPF().equals(CPF)) {
                Integer idCliente = locacao.getIdCliente().getId();
                DadosLocacao locacaoCliente = (DadosLocacao) session.createQuery("from DadosLocacao where ID_CLIENTE =: ID_CLIENTE")
                        .setParameter("ID_CLIENTE", idCliente).getSingleResult();
                return locacaoCliente;
            }
        }
        return null;
    }

    private static void showHistorico(Session session) {
        List<HistoricoLocacoes> historico = session.createQuery("from HistoricoLocacoes").getResultList();
        if (historico.size() == 0) {
            System.out.println("Não há histórico a ser exibido");
        } else {
            historico.forEach(locacoes -> {
                System.out.println("\nLocação realizada por: " + locacoes.getIdDevolucao().getIdDadosLocacao().getIdCliente().getNome() +
                        " (CPF: " + locacoes.getIdDevolucao().getIdDadosLocacao().getIdCliente().getCPF() + ")" +
                        " - Carro: " + locacoes.getIdDevolucao().getIdDadosLocacao().getIdCarro().getMontadora() + " " +
                        locacoes.getIdDevolucao().getIdDadosLocacao().getIdCarro().getCarro() + " " +
                        locacoes.getIdDevolucao().getIdDadosLocacao().getIdCarro().getCor() + " Placa:  " +
                        locacoes.getIdDevolucao().getIdDadosLocacao().getIdCarro().getPlaca() + " Ano:  " +
                        locacoes.getIdDevolucao().getIdDadosLocacao().getIdCarro().getAno() +
                        " - KM Rodados: " + locacoes.getKmRodado() + " KMs " +
                        " - Carro retirado na Unidade: " + locacoes.getIdDevolucao().getIdDadosLocacao().getIdUnidadeCarlocaOrigem().getNomeUnidade() +
                        " - E devolvido na Unidade: " + locacoes.getIdDevolucao().getIdUnidadeCarlocaFim().getNomeUnidade() +
                        " - Valor Final: R$ " + locacoes.getValorFinal() + ",00");
            });
        }
    }
}
