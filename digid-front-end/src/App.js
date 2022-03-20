import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <div className="App-header">
        Identification made easy
      </div>
      <div className="form">
      <form>
        <div className="boxes">
          <br></br> <br></br>
          <label className="infolabel" for="wallet">Enter Wallet Address</label>
          <br></br>
          <input type="text" className="textbox" id="wallet"/>
          <br></br> <br></br> <br></br>
          
          <label className="infolabel" for="eid">Enter UT EID</label>
          <br></br>
          <input type="text" className="textbox" id="eid"/>
          <br></br> <br></br> <br></br>

          <label className="infolabel" for="eid">Enter Name</label>
          <br></br>
          <input type="text" className="textbox" id="eid"/>
          <br></br> <br></br> <br></br>
        </div>
        <input type="submit" value="Mint ID!" className="mint"/>
      </form>
      </div>
      <div className="conlcude">Made with Dig[iD]</div>
    </div>
  );
}

export default App;
