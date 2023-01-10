package com.re.popJourney.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

@Controller
@Slf4j
public class PropertiesController {
    @RequestMapping("/bundle/{propertiesName}")
    public void getProperties(@PathVariable String propertiesName, HttpServletResponse response) throws IOException, IOException {
        log.debug("############################");
        log.debug("############################");
        log.debug("############################");

        OutputStream outputStream = response.getOutputStream();
        log.debug(outputStream.toString());
        Resource resource = new ClassPathResource(propertiesName);
        log.debug(resource.toString());
        InputStream inputStream = resource.getInputStream();

        log.debug("resource = {}", resource.toString());
        log.debug("############################");
        log.debug("############################");
        log.debug("############################");

        List<String> readLines = IOUtils.readLines(inputStream);
        IOUtils.writeLines(readLines, null, outputStream);

        IOUtils.closeQuietly(inputStream);
        IOUtils.closeQuietly(outputStream);
    }
}

