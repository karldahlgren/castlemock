package com.castlemock.web.mock.soap.repository.project;


import com.castlemock.core.mock.soap.model.project.domain.SoapProject;
import com.castlemock.web.basis.support.FileRepositorySupport;
import com.castlemock.web.mock.soap.model.project.SoapProjectGenerator;
import com.castlemock.web.mock.soap.repository.project.SoapProjectRepositoryImpl;
import org.dozer.DozerBeanMapper;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.*;
import org.springframework.test.util.ReflectionTestUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Karl Dahlgren
 * @since 1.4
 */
public class SoapProjectRepositoryTest {

    @Mock
    private FileRepositorySupport fileRepositorySupport;
    @Spy
    private DozerBeanMapper mapper;
    @InjectMocks
    private SoapProjectRepositoryImpl repository;
    private static final String DIRECTORY = "/directory";
    private static final String EXTENSION = ".extension";

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
        ReflectionTestUtils.setField(repository, "soapProjectFileDirectory", DIRECTORY);
        ReflectionTestUtils.setField(repository, "soapProjectFileExtension", EXTENSION);
    }

    @Test
    public void testInitialize(){
        List<SoapProject> soapProjects = new ArrayList<SoapProject>();
        SoapProject soapProject = SoapProjectGenerator.generateFullSoapProject();
        soapProjects.add(soapProject);
        Mockito.when(fileRepositorySupport.load(SoapProject.class, DIRECTORY, EXTENSION)).thenReturn(soapProjects);
        repository.initialize();
        Mockito.verify(fileRepositorySupport, Mockito.times(1)).load(SoapProjectRepositoryImpl.SoapProjectFile.class, DIRECTORY, EXTENSION);
    }

    @Test
    public void testFindOne(){
        final SoapProject soapProject = save();
        final SoapProject returnedSoapEvent = repository.findOne(soapProject.getId());
        Assert.assertEquals(returnedSoapEvent.getId(), soapProject.getId());
        Assert.assertEquals(returnedSoapEvent.getName(), soapProject.getName());
        Assert.assertEquals(returnedSoapEvent.getDescription(), soapProject.getDescription());
        Assert.assertEquals(returnedSoapEvent.getTypeIdentifier(), soapProject.getTypeIdentifier());
    }

    @Test
    public void testFindAll(){
        final SoapProject soapProject = save();
        final List<SoapProject> soapProjects = repository.findAll();
        Assert.assertEquals(soapProjects.size(), 1);
        Assert.assertEquals(soapProjects.get(0).getId(), soapProject.getId());
        Assert.assertEquals(soapProjects.get(0).getName(), soapProject.getName());
        Assert.assertEquals(soapProjects.get(0).getDescription(), soapProject.getDescription());
        Assert.assertEquals(soapProjects.get(0).getTypeIdentifier(), soapProject.getTypeIdentifier());
    }

    @Test
    public void testSave(){
        final SoapProject soapProject = save();
        Mockito.verify(fileRepositorySupport, Mockito.times(1)).save(Mockito.any(SoapProject.class), Mockito.anyString());
    }

    @Test
    public void testDelete(){
        final SoapProject soapProject = save();
        repository.delete(soapProject.getId());
        Mockito.verify(fileRepositorySupport, Mockito.times(1)).delete(DIRECTORY + File.separator + soapProject.getId() + EXTENSION);
    }

    @Test
    public void testCount(){
        final SoapProject soapProject = save();
        final Integer count = repository.count();
        Assert.assertEquals(new Integer(1), count);
    }

    private SoapProject save(){
        SoapProject soapProject = SoapProjectGenerator.generateFullSoapProject();
        repository.save(soapProject);
        return soapProject;
    }

}
