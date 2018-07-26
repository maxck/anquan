public class SimpleXmlParserClass {
public class Advertiser{
        String id;
        String name;
    }

    public Advertiser parseAdvertiser(XmlStreamReader reader){

        Advertiser advertiserObj = new Advertiser();
        advertiserObj.id = reader.getAttributeValue(null, 'author');

        boolean isSafeToGetNextXmlElement = true;
        while(isSafeToGetNextXmlElement) {

            if (reader.getEventType() == XmlTag.END_ELEMENT 
                && reader.getLocalName() == 'advertiser') {
                break;
            }

            if(reader.getLocalName() == 'id'){
                reader.next();
                advertiserObj.id = reader.getText();
                while(reader.isStartElement()!= true){ 
                //We need to loop through until 
                //we are pointing to start element of 
                //name tage for that advertiser.
                    reader.nextTag();
                }
            }

            if(reader.getLocalName() == 'name'){
                reader.next();
                advertiserObj.name = reader.getText();
                while(reader.isEndElement()!= true){ 
                //We need to move to the next tag 
                //until we reach end of element name.
                    reader.nextTag();
                }
            }

            // Always use hasNext() before calling next() to confirm 
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
                reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
        return advertiserObj;    
    }      

    public Advertiser[] parseAdvertisers(XmlStreamReader reader){
        Advertiser[] advertisersList = new Advertiser[0];
        boolean isSafeToGetNextXmlElement = true;
        while(isSafeToGetNextXmlElement) {
            // Start at the beginning of the advertiser
            // and make sure that it is a advertiser
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
                if ('advertiser' == reader.getLocalName()) {
                    // Pass the book to the parseBook method (below) 
                    Advertiser advObj = parseAdvertiser(reader);
                    advertisersList.add(advObj);
                }
            }
            // Always use hasNext() before calling next() to confirm 
            // that we have not reached the end of the stream
            if (reader.hasNext()) {
                reader.next();
            } else {
                isSafeToGetNextXmlElement = false;
                break;
            }
        }
        return advertisersList;
    }

}