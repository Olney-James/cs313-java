/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scriptures.model;

/**
 *
 * @author james_olney
 */
import java.util.ArrayList;
import java.util.List;

public class HardCodedScriptureHandler implements ScriptureDataHandler {

  @Override
  public List<Scripture> getFavoriteScriptures() {
    List<Scripture> scriptures = new ArrayList<Scripture>();

    scriptures.add(new Scripture("Proverbs", 3, 5));
    scriptures.add(new Scripture("Doc. & Cov.", 112, 10));
    scriptures.add(new Scripture("John", 7, 17));

    return scriptures;
  }
}
