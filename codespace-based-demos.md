# CodeSpaces based demos

### Prep step I - Create a Codespace and learn how to connect to its built-in VNC desktop

1. Create a personal CodeSpace secret "ORG_NAME" and set it to your PlanetScale org

Set **ORG_NAME** as a [personal Codespace secret](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces) in your GitHub profile settings. Make sure, you grant this repository access to it:

![image](https://user-images.githubusercontent.com/1872314/141357342-79a22cc0-4201-493b-bd15-de7ab4df8199.png)

2. Create a Codespace of this repository, [preferably in the US-East region](https://docs.github.com/en/codespaces/managing-your-codespaces/setting-your-default-region-for-codespaces) (lowest network latency to the database branch used) with at least 8 cores and wait a moment for the environment to initialize

![image](https://user-images.githubusercontent.com/1872314/136702903-480e7f4b-76c4-4abb-b401-c4f252089e19.png)

3. Switch to the [built-in VNC web browser](https://github.com/microsoft/vscode-dev-containers/blob/main/script-library/docs/desktop-lite.md) from the forwarded ports section of your Codespace ([click on the globe symbol in the line with port 6080](https://www.youtube.com/watch?v=ihqfS-6YdUs&t=65s)), then click on *Connect* in the new browser tab that opens, password is **vscode**

![image](https://user-images.githubusercontent.com/1872314/136703362-fd45351a-a57f-49e9-ab9c-8cd94f3f5251.png)

![image](https://user-images.githubusercontent.com/1872314/136704442-db133792-ecde-4aac-99a2-00199d094183.png)

**Note**: If clicking on the connect button does not connect you even though you tried multiple times (can happen after a Codespace restart), please force refresh the browser page (by clicking CMD + Shift + R on a Mac) as the VNC code cached in your browser is probably trying to connect to a stale backend.

### Prep step II - Create a database

Create your personal database and set your DB connection string (only needed once)

Run the following commands in the VSCode terminal:

```bash
 ./create-database.sh
```

Follow the link in the terminal (CMD + click on the link). Once the command has successfully finished, you should have your own database **matrix-demos-yourgithubaccount** in your org. Before you can connect to that database, you would have to set the **MY_DB_URL** environment variable to the value mentioned in the script output. The easiest, and least error-prone way to do so would be to set **MY_DB_URL** as a [personal Codespace secret](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces) in your GitHub profile settings. Make sure, you grant this repository access to it:

![image](https://user-images.githubusercontent.com/1872314/137978547-d6845e9f-94c1-4ab9-a48d-32d66702268b.png)

Finally, in order for your Codespace to pick up the change, you would have to [stop](https://docs.github.com/en/codespaces/codespaces-reference/using-the-command-palette-in-codespaces#suspending-or-stopping-a-codespace) and restart it. After that, you do not have to worry about this step ever again 🎉


## How to use parallel connection test demo


1. In the VNC browser tab, open the menu with a right click (two fingers on the touch pad of a Mac)

![image](https://user-images.githubusercontent.com/1872314/137810015-ee4211b5-9f25-40d5-ac70-a5ed89287126.png)

and select the first menu item to start the visualization GUI:

![image](https://user-images.githubusercontent.com/1872314/136703801-8a2723b5-6458-45b1-8824-fa19c5ee490a.png)

2. Either go back to the terminal in your Codespace or click on the picture that appeared to see the shell again and start the test:
```bash
./start-parallel-connection-test.sh
```
By default, this will launch 192 docker containers with 10 database connections each, all of them streaming pixel data into the PlanetScale database. Each connection is responsible to stream the pixels of the pixel_data within a particular matrix cell. By default, there are 192 matrix cells with 50x50 pixels so that each connection is streaming 5 lines with 50 pixels each, switching between color and grey-scale until the process ends. 

![image](https://user-images.githubusercontent.com/1872314/136704301-98a55cd1-607d-42ce-8ea6-2d0917a16651.png)

3. [Watch the progress](https://youtu.be/SV_f7vNMihI) in the GUI

![image](https://user-images.githubusercontent.com/1872314/136703039-cb0813e9-0cb1-4b80-b274-b92d370769ea.png)

4. Check out the connection stats in the [PlanetScale demo org](https://app.planetscale.com/planetscale-demo/)

![image](https://user-images.githubusercontent.com/1872314/136703230-bf81b245-f0b3-4ed4-931b-44d82b2e39a3.png)

5. Change the parameters in [**test-parameters.json**](https://github.com/planetscale/parallel-connection-test/blob/ps/test-parameters.json), e.g. try out more DB connections per cell (default is 192 cells with 10 connections each, resulting in 1920 connections in total, more than 50 connections per cell does not make any sense though).

![image](https://user-images.githubusercontent.com/1872314/136704798-e498bcfd-c820-40ae-986b-5bf60fa61a80.png)

6. Adopt to your own needs, PRs welcome :blush: - **and don't forget to [stop your Codespace(s)](https://docs.github.com/en/codespaces/codespaces-reference/using-the-command-palette-in-codespaces#suspending-or-stopping-a-codespace) if it was still running**

![image](https://user-images.githubusercontent.com/1872314/136704846-6d53916b-2649-43b3-9c9e-31b52ad81ebd.png)

7. Profit 🥬

![image](https://user-images.githubusercontent.com/1872314/136865713-93efb928-59b5-47b7-8e6b-35e06449fba7.png)

## How to use non-blocking schema change demo

1. The non-blocking schem change demo starts like the [Parallel connections demo](#how-to-use-parallel-connection-test-demo), by first starting the visualization GUI:

In the VNC browser tab, open the menu with a right click (two fingers on the touch pad of a Mac)

![image](https://user-images.githubusercontent.com/1872314/137810015-ee4211b5-9f25-40d5-ac70-a5ed89287126.png)

and select the first menu item to start the visualization GUI:

![image](https://user-images.githubusercontent.com/1872314/136703801-8a2723b5-6458-45b1-8824-fa19c5ee490a.png)

2. Go back to the Codespace tab and start the following command in the first terminal:
```bash
./start-parallel-connection-test.sh
```

![image](https://user-images.githubusercontent.com/1872314/137982833-ed2105c6-1560-442f-a2cb-55b081f8efa8.png)

This will start streaming pixels to the visualization GUI using the [first version of the schema](https://app.planetscale.com/planetscale-demo/matrix-demos/main/schema):

![image](https://user-images.githubusercontent.com/1872314/138086168-11d895ae-43b8-4151-a033-d0ea424502be.png)

![image](https://user-images.githubusercontent.com/1872314/136703039-cb0813e9-0cb1-4b80-b274-b92d370769ea.png)

3. Now, we like to propose a schema change to the **pixel_matrix** table by adding a column **operation** to it which would allow pixel cell content to be PINNED, i.e. not be overridden by any other workers writing to the same cell.

The schema change is proposed in a new feature branch called [**add-operation-column-and-index**](add-operation-column-and-index) and will change the schema [like this](https://app.planetscale.com/planetscale-demo/matrix-demos/deploy-requests/1/diff):

![image](https://user-images.githubusercontent.com/1872314/138086616-c1f21a53-09ac-411c-9bb7-339c9ae04bb3.png)

In order to create the database feature branch and the corresponding deploy request, run the following script in a new terminal of your VSCode tab:

```bash
./add-operation-column-and-index.sh
```

Once the script completed, you should have your new deployment request created:

![image](https://user-images.githubusercontent.com/1872314/138087990-076b12b2-4bda-470f-a02c-aa7e3bd92277.png)

You can now [navigate to the deploy request](https://app.planetscale.com/planetscale-demo/matrix-demos/deploy-requests/1/diff) and check that it is actually going to add the operation column and an index.

4. Now the power of non-blocking schema upgrades kicks in - you can merge the deploy request either from the PlanetScale Web UI or from the VSCode terminal by running

```bash
./merge-latest-open-deploy-request.sh
```

![image](https://user-images.githubusercontent.com/1872314/138089205-a958fa02-a3c5-4ab7-bbe2-b6143c684dc9.png)

For the best visual effect, you would close and restart the visualization GUI just before you start merging the schema (optional).

While the operation is runnning, draw the attention to the PlanetScale Visualization GUI which continuously receives updates from the workers still using the old schema. **This is the power of non-blocking schema updates - existing operations on the table just continue without any locking / blocking issues :tada:

5. Now, we like to make use of the new operations column in the table we just merged in. First, we will turn the visualization GUI into a mode where it will use the new schema. This can be done by right clicking (two fingers on a Mac) on the Visualization GUI window and selecting **Use advanced schema**

![image](https://user-images.githubusercontent.com/1872314/138093118-64549d7d-981f-4dbb-9ad1-683feb8dfaaf.png)

After that, you can start a couple of new workers that stream PINNED pixels using the new schema:

```bash
./start-advanced-schema-stream.sh 
```

![image](https://user-images.githubusercontent.com/1872314/138094474-931a44ef-7b00-4fa2-ac72-0ba216207b86.png)

6. Finally, it is time to revert the schema change. For this, you would need to run

```bash
./remove-operation-column-and-index.sh && ./merge-latest-open-deploy-request.sh 
```

in a terminal to create a database feature branch [remove-operation-column-and-index](https://app.planetscale.com/planetscale-demo/matrix-demos/remove-operation-column-and-index) and a [corresponding deploy request](https://app.planetscale.com/planetscale-demo/matrix-demos/deploy-requests/2). 

![image](https://user-images.githubusercontent.com/1872314/138318215-d3b82853-2d38-41f4-8884-a896c645f2d3.png)


Once you approve the [reverse deploy request](https://app.planetscale.com/planetscale-demo/matrix-demos/deploy-requests/2/diff), non-blocking schema migration will kick in - database operations still using the old schema will still work until the schema migration has finished. If you have not switched the visualization GUI back to use the original schema, it will exit automatically once the operation column has been removed. 

7. As with any demo, **don't forget to [stop your Codespace(s)](https://docs.github.com/en/codespaces/codespaces-reference/using-the-command-palette-in-codespaces#suspending-or-stopping-a-codespace) if it was still running**
