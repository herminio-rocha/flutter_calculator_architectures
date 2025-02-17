<h1 align="center">Calculator - MVC</h1>

<br>
<p align="center">
  <strong>🇧🇷 Português</strong>
</p>

<h2>✨ Sobre o Projeto</h2>
<p>O Calculator MVC é um projeto desenvolvido em Flutter, estruturado seguindo o padrão arquitetural MVC (Model-View-Controller).
O objetivo deste projeto é demonstrar como organizar um código limpo, modular e escalável em Flutter, separando claramente as responsabilidades entre dados, interface gráfica e controle de fluxo.

Este projeto faz parte do repositório Flutter Calculator Architectures, onde diferentes abordagens arquiteturais são exploradas e comparadas.</p>

<br>
<h2>📚 O que é MVC?</h2>
<p>O Model-View-Controller (MVC) é um dos padrões arquiteturais mais conhecidos e amplamente utilizados no desenvolvimento de software. Ele divide a aplicação em três camadas principais, cada uma com sua responsabilidade bem definida:</p>
<div align="center">
  <table>
    <thead>
      <tr>
        <th align="center">Camada</th>
        <th align="center">Responsabilidade</th>
        <th align="center">No Projeto</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td align="center">Model</td>
        <td align="center">Gerencia os dados e a lógica de negócios. Não tem contato direto com a interface do usuário.</td>
        <td align="center"><i>Calculation, CalculatorModel, MathExpressionProcessor</i></td>
      </tr>
      <tr>
        <td align="center">View</td>
        <td align="center">Responsável por exibir a interface gráfica e capturar interações do usuário. Não contém lógica, nem regras de negócio.</td>
        <td align="center"><i>AndroidCalculatorView, IosCalculatorView</i></td>
      </tr>
      <tr>
        <td align="center">Controller</td>
        <td align="center"">Faz a ponte entre Model e View, processando entradas do usuário.</td>
        <td align="center""><i>CalculatorController</i></td>
      </tr>
    </tbody>
  </table>
</div>

<h3>📌 Decisões Técnicas</h3>
<ul>
  <li>Repository atua como a única fonte de entrada dos dados, nesse caso usada para as configurações dos botões.</li>
  <li>Views foram separadas por plataforma (Android e iOS).</li>
</ul>

<br>
<h2>🚀 Por que usar MVC?</h2>
<p>O MVC é uma arquitetura sólida e amplamente adotada, especialmente para projetos que precisam de uma estrutura clara e de fácil manutenção. Algumas vantagens incluem:</p>
<ul>
  <li><strong>Separação de Responsabilidades</strong>: Cada camada tem um papel bem definido, facilitando a organização do código.</li>
  <li><strong>Facilidade de Manutenção</strong>: Como as responsabilidades estão isoladas, alterações na UI não afetam diretamente a lógica de negócios.</li>
  <li><strong>Reutilização de Código</strong>: O Model pode ser reaproveitado em diferentes partes do aplicativo.</li>
  <li><strong>Evolução Gradual</strong>: Projetos MVC podem ser facilmente escalados, introduzindo novas funcionalidades sem comprometer a arquitetura.</li>
</ul>

<p>O padrão MVC é indicado para aplicações de pequeno a médio porte, onde a complexidade não justifica camadas extras de abstração. Sendo uma ótima escolha quando se deseja manter a estrutura do código simples e direta e o projeto não exige uma alta reatividade da interface.</p>

<br>
<h2>🔎 Como o MVC funciona neste projeto?</h2>
<ol>
  <li><strong>O usuário interage com a View</strong>: Pressiona um botão na calculadora.</li>
  <li><strong>A View chama o Controller</strong>: calculatorController.add();</li>
  <li><strong>O Controller delega a ação para o Model</strong>: calculatorModel.add();</li>
  <li><strong>O Model executa a lógica e chama notifyListeners()</strong>: Isso avisa a View que os dados foram atualizados.</li>
  <li><strong>A View escuta essa mudança e se reconstrói automaticamente</strong>: setState();</li>
</ol>

<br>
<h2>🏗 Estrutura do Código</h2>
<p>A organização do projeto segue a estrutura padrão do Flutter, adaptada ao MVC, garantindo clareza e modularidade:</p>
<ul>
  <li><strong>lib/</strong>: Código-fonte principal do projeto.</li>
  <li><strong>lib/model/</strong>: Lógica de cálculo, manipulação de dados e regras de negócio.</li>
  <li><strong>lib/view/</strong>: Telas e widgets da interface gráfica.</li>
  <li><strong>lib/controller/</strong>: Lógica intermediária entre Model e View.</li>
  <li><strong>lib/repository/</strong>: Centraliza a configuração dos botões da calculadora.</li>
  <li><strong>lib/util: </strong>: Classes utilitárias.</li>
  <li><strong>lib/util: </strong>: Classes helper.</li>
</ul>


<br>
<h2>🎯 Considerações Finais</h2>
<p align="center"><em>Este projeto foi desenvolvido para demonstrar boas práticas no padrão MVC, reforçando a separação de responsabilidades e a organização do código no Flutter. Embora o MVC seja uma abordagem consolidada, seu uso deve sempre considerar a escala e complexidade do projeto.</em></p>
<p align="center"><em>Agradeço por explorar este estudo e espero que ele seja útil para aprendizado, referência e inspiração. 🚀</em></p>
<p align="center"><em>Jesus abençoe a todos 🙏</em></p>
<h2></h2>
<br>

<br>
<p align="center">
  <strong>🇺🇸 English</strong>
</p>

<h2>✨ About the Project</h2>
<p>Calculator MVC is a Flutter-based project structured following the Model-View-Controller (MVC) architectural pattern. The goal of this project is to demonstrate how to organize clean, modular, and scalable code in Flutter by clearly separating responsibilities between data management, UI rendering, and application flow control.

This project is part of the Flutter Calculator Architectures repository, where different architectural approaches are explored and compared.</p>

<br>
<h2>📚 What is MVC?</h2>
<p>The Model-View-Controller (MVC) is one of the most widely known and used software architectural patterns. It divides an application into three main layers, each with a well-defined responsibility:</p>
<div align="center">
  <table>
    <thead>
      <tr>
        <th align="center">Layer</th>
        <th align="center">Responsibility</th>
        <th align="center">In This Project</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td align="center">Model</td>
        <td align="center">Manages data and business logic. It does not interact directly with the user interface.</td>
        <td align="center"><i>Calculation, CalculatorModel, MathExpressionProcessor</i></td>
      </tr>
      <tr>
        <td align="center">View</td>
        <td align="center">Responsible for displaying the user interface and capturing user interactions. It contains no logic or business rules.</td>
        <td align="center"><i>AndroidCalculatorView, IosCalculatorView</i></td>
      </tr>
      <tr>
        <td align="center">Controller</td>
        <td align="center"">Acts as a bridge between the Model and View, processing user inputs.</td>
        <td align="center""><i>CalculatorController</i></td>
      </tr>
    </tbody>
  </table>
</div>

<h3>📌 Technical Decisions</h3>
<ul>
  <li>The Repository serves as the single source of truth for button configurations.</li>
  <li>Views are separated by platform (Android and iOS).</li>
</ul>

<br>
<h2>🚀 Why Use MVC?</h2>
<p>MVC is a solid and widely adopted architecture, particularly for projects that require a clear and maintainable structure. Key advantages include:</p>
<ul>
  <li><strong>Separation of Concerns</strong>: Each layer has a well-defined role, making the code more organized.</li>
  <li><strong>Easier Maintenance</strong>: UI changes do not directly affect business logic.</li>
  <li><strong>Code Reusability</strong>: The Model can be reused across different parts of the application.</li>
  <li><strong>Scalability</strong>: MVC projects can easily grow by introducing new features without breaking the architecture.</li>
</ul>

<p>MVC is best suited for small to medium-sized applications, where added layers of abstraction are unnecessary. It is a great choice for maintaining simple and straightforward code, especially when the project does not require a highly reactive UI.</p>

<br>
<h2>🔎 How Does MVC Work in This Project?</h2>
<ol>
  <li><strong>The user interacts with the View</strong>: Pressing a button on the calculator.</li>
  <li><strong>The View calls the Controller</strong>: calculatorController.add();</li>
  <li><strong>The Controller forwards the action to the Model</strong>: calculatorModel.add();</li>
  <li><strong>The Model executes the logic and triggers notifyListeners()</strong>: to update the UI.</li>
  <li><strong>The View listens to this change and automatically rebuilds</strong>: setState();</li>
</ol>

<br>
<h2>🏗 Project Structure</h2>
<p>The project follows the standard Flutter structure, adapted for MVC to ensure clarity and modularity:</p>
<ul>
  <li><strong>lib/</strong>: Main project source code.</li>
  <li><strong>lib/model/</strong>: Handles business logic and data processing.</li>
  <li><strong>lib/view/</strong>: UI screens and widgets.</li>
  <li><strong>lib/controller/</strong>: Manages interactions between UI and data.</li>
  <li><strong>lib/repository/</strong>: Centralized management of calculator button configurations.</li>
  <li><strong>lib/util: </strong>: Utility classes.</li>
  <li><strong>lib/helper: </strong>: Helper classes.</li>
</ul>


<br>
<h2>🎯 Final Thoughts</h2>
<p align="center"><em>This project was designed to showcase best practices in MVC, reinforcing the separation of concerns and code organization in Flutter. While MVC is a well-established approach, its use should always be evaluated based on project scale and complexity.</em></p>
<p align="center"><em>I appreciate your interest in this study and hope it serves as a valuable learning resource and reference. 🚀</em></p>
<p align="center"><em>🙏 May Jesus bless you all!</em></p>
