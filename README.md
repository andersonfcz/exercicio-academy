# Exercício-academy
## Exercício do Five Academy com o intuito de praticar conceitos DevOps aprendidos.
 
### Exercício proposto:
Crie uma Docker Image que tenha como premissa rodar aplicações Web em Java com as seguintes especificações:
 
- Uma imagem de CentOS ou Ubuntu
- Um servidor Apache (Tomcat, Jboss, GlassFish)
- Adicione suporte HTTPS
- Um banco de dados a ser conectado a aplicação
 
 
### Resultado:
Para criar a imagem e utilizado um multi-stage build composto de:
- Imagem <strong><em>certbot</em></strong> para geração dos certificados de forma facilitada. Para simplificação foi utilizado um mock na geração dos certificados.
- Imagem do servidor web <strong><em>tomcat-correto</strong></em> da Amazon na versao <strong>10.0.8</strong> com a <em>jdk</em> na versão <strong>16</strong>.

### Como utilizar:
Para utilizar deve-se definir previamente as seguintes variáveis de ambiente:
- <strong><em>DOMAIN</em></strong>  domínio para o qual o certificado sera gerado
- <strong><em>EMAIL</em></strong>  e-mail para geração do certificado
- <strong><em>DB_ADDR</em></strong>  ip do banco ao qual a aplicação ira se conectar
- <strong><em>DB_NAME</em></strong>  nome do banco ao qual a aplicação ira se conectar
- <strong><em>DB_USER</em></strong>  usuário para se conectar ao banco
- <strong><em>DB_PASS</em></strong>  senha do banco

- Utilize o comando <strong><em>make build</strong><em> para fazer o build da imagem docker passando como parâmetro <strong><em>tag=tag_para_a_imagem</em></strong>.
 
`make build tag=minhatag/tomcat`
 
- Você também pode passar opcionalmente o parâmetro <strong><em>package=seu_pacote_java.war</em></strong> para definir sua própria aplicação java a ser utilizada. Caso não seja passado o parâmetro package a imagem sera criada com o <strong><em>sample.war</em></strong>
 
`make build tag=minhatag/tomcat package=meu_app.war`
 
- Apos o build da imagem utilize o <strong><em>make run</strong></em> passando a tag utilizada durante o build
 
`make run tag=minhatag/tomcat`
 
 

