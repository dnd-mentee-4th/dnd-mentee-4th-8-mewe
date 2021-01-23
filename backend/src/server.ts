import express = require('express');
import { logger } from './utils/logger';

export class App {
  public application : express.Application;

  constructor() {
    this.application = express();
  }
}

const app = new App().application;

app.get("/", (req: express.Request, res: express.Response) =>{
    res.send("hello world!");
});

app.listen(3000, () => {
    logger.info('⚡️Server is running!`');
});

export default app;